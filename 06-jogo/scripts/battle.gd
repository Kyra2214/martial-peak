extends CanvasLayer
## Combate ATB (modo "wait": as barras param enquanto o menu esta aberto).
## Todos os numeros sao [J]/[AJUSTAR] ate o balanceamento da Fase 5.

signal finished(result: Dictionary)

const ATB_SPEED := 4.0

var player: Dictionary = {}
var enemy: Dictionary = {}
var state := "idle"      # idle, run, menu, busy, over
var auto_play := false   # usado pelos testes
var step_delay := 0.5

var _ui: Dictionary = {}
var _menu_box: VBoxContainer
var _log_label: RichTextLabel
var _rng := RandomNumberGenerator.new()

func _ready() -> void:
	layer = 20

func start(enemy_def: Dictionary) -> void:
	_rng.randomize()
	player = {
		"name": "Yang Kai", "hp": GameState.hp, "max_hp": GameState.max_hp,
		"qi": GameState.qi, "max_qi": GameState.max_qi,
		"atk": GameState.atk, "def": GameState.def, "vel": GameState.vel,
		"atb": 0.0, "guard": false, "evade": 0, "def_buff": 0,
	}
	enemy = enemy_def.duplicate()
	enemy["max_hp"] = enemy["hp"]
	enemy["atb"] = 0.0
	_build_ui()
	_refresh()
	_log("%s quer duelar!" % enemy["name"])
	state = "run"

# ---------- loop ----------

func _process(delta: float) -> void:
	if state != "run":
		return
	player["atb"] = minf(100.0, player["atb"] + player["vel"] * ATB_SPEED * delta)
	enemy["atb"] = minf(100.0, enemy["atb"] + enemy["vel"] * ATB_SPEED * delta)
	_refresh()
	if player["atb"] >= 100.0:
		_open_menu()
	elif enemy["atb"] >= 100.0:
		_enemy_act()

func _wait(seconds: float) -> void:
	await get_tree().create_timer(0.01 if auto_play else seconds).timeout

# ---------- turno do inimigo ----------

func _enemy_act() -> void:
	state = "busy"
	enemy["atb"] = 0.0
	var evaded: bool = player["evade"] > 0 and _rng.randf() < 0.4
	if player["evade"] > 0:
		player["evade"] -= 1
	if evaded:
		_log("Yang Kai se esquiva do golpe de %s!" % enemy["name"])
	else:
		var def_val := float(player["def"])
		if player["def_buff"] > 0:
			def_val *= 1.5
		var d := _damage(float(enemy["atk"]), 1.0, def_val, player["guard"])
		player["hp"] = maxi(0, player["hp"] - d)
		_log("%s ataca: %d de dano." % [enemy["name"], d])
	if player["def_buff"] > 0:
		player["def_buff"] -= 1
	_refresh()
	await _wait(step_delay)
	if _check_end():
		return
	state = "run"

func _damage(atk: float, mult: float, defense: float, guard: bool) -> int:
	var base := atk * mult - defense * 0.5
	if guard:
		base *= 0.5
	return maxi(1, roundi(base * _rng.randf_range(0.9, 1.1)))

# ---------- turno do jogador ----------

func _open_menu() -> void:
	state = "menu"
	player["guard"] = false
	_show_main_menu()
	if auto_play:
		_auto_choose()

func _show_main_menu() -> void:
	_set_menu([
		{"text": "Atacar", "cb": _act_attack},
		{"text": "Técnica", "cb": _show_tech_menu},
		{"text": "Item", "cb": _show_item_menu},
		{"text": "Defender", "cb": _act_defend},
	])

func _auto_choose() -> void:
	_act_attack()

func _act_attack() -> void:
	_hit_enemy(1.0, "Golpe Básico")
	_finish_turn()

func _act_defend() -> void:
	player["guard"] = true
	_log("Yang Kai se prepara para defender.")
	_finish_turn()

func _hit_enemy(mult: float, label: String) -> void:
	var d := _damage(float(player["atk"]), mult, float(enemy["def"]), false)
	enemy["hp"] = maxi(0, enemy["hp"] - d)
	_log("Yang Kai usa %s: %d de dano." % [label, d])

func _show_tech_menu() -> void:
	var opts: Array = []
	for tname in DataDB.techniques:
		var t: Dictionary = DataDB.techniques[tname]
		if tname == "Golpe Básico" or "passiva" in str(t["efeito"]):
			continue
		if int(t["nivel"]) > GameState.level or not str(t["custo_qi"]).is_valid_int():
			continue
		var cost := int(t["custo_qi"])
		opts.append({
			"text": "%s (%d Qi)" % [tname, cost],
			"disabled": cost > player["qi"],
			"cb": func(): _use_tech(t),
		})
	opts.append({"text": "Voltar", "cb": _show_main_menu})
	_set_menu(opts)

func _use_tech(t: Dictionary) -> void:
	var tname: String = t["nome"]
	player["qi"] -= int(t["custo_qi"])
	match tname:
		"Respirar Qi":
			player["qi"] = mini(player["max_qi"], player["qi"] + int(player["max_qi"] * 0.2))
			_log("Yang Kai respira fundo e recupera Qi.")
		"Passo Leve":
			player["evade"] = 3
			_log("Yang Kai ganha esquiva por 3 turnos.")
		"Corpo Dourado do Osso Orgulhoso":
			player["def_buff"] = 4
			_log("Yang Kai endurece o corpo: DEF aumentada.")
		_:
			if float(t["multiplicador_atk"]) > 0.0:
				_hit_enemy(float(t["multiplicador_atk"]), tname)
			else:
				_log("%s: %s" % [tname, t["efeito"]])
	_finish_turn()

func _show_item_menu() -> void:
	var opts: Array = []
	for id in GameState.inventory:
		var qty := int(GameState.inventory[id])
		if qty > 0 and DataDB.items.has(id):
			var item: Dictionary = DataDB.items[id]
			opts.append({"text": "%s x%d" % [item["nome"], qty], "cb": func(): _use_item(id)})
	if opts.is_empty():
		opts.append({"text": "(sem itens)", "disabled": true, "cb": func(): pass})
	opts.append({"text": "Voltar", "cb": _show_main_menu})
	_set_menu(opts)

func _use_item(id: String) -> void:
	var item: Dictionary = DataDB.items[id]
	if item["tipo"] == "cura":
		var heal := int(item["efeito_hp"])
		player["hp"] = mini(player["max_hp"], player["hp"] + heal)
		_log("%s usada: +%d HP." % [item["nome"], heal])
	GameState.inventory[id] = int(GameState.inventory[id]) - 1
	_finish_turn()

func _finish_turn() -> void:
	state = "busy"
	_set_menu([])
	player["atb"] = 0.0
	_refresh()
	await _wait(step_delay)
	if _check_end():
		return
	state = "run"

# ---------- fim ----------

func _check_end() -> bool:
	if enemy["hp"] <= 0:
		_finish(true)
		return true
	if player["hp"] <= 0:
		_finish(false)
		return true
	return false

func _finish(won: bool) -> void:
	state = "over"
	_set_menu([])
	_log("Vitória!" if won else "Yang Kai cai no chão...")
	await _wait(1.4)
	GameState.hp = maxi(1, player["hp"]) if won else 0
	GameState.qi = player["qi"]
	GameState.changed.emit()
	finished.emit({"won": won})
	queue_free()

# ---------- UI ----------

func _build_ui() -> void:
	var root := Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(root)
	var bg := ColorRect.new()
	bg.color = Color("#1b1f2a")
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.add_child(bg)
	# figuras
	var ef := ColorRect.new()
	ef.color = Color("#a0522d")
	ef.position = Vector2(740, 90)
	ef.size = Vector2(70, 110)
	root.add_child(ef)
	var pf := ColorRect.new()
	pf.color = Color("#3b6ea5")
	pf.position = Vector2(180, 200)
	pf.size = Vector2(70, 110)
	root.add_child(pf)
	# painel inimigo
	var ep := _panel(root, Vector2(40, 24), Vector2(400, 100))
	_ui["e_name"] = _label(ep, Vector2(12, 6), enemy["name"])
	_ui["e_hp"] = _bar(ep, Vector2(12, 36), Color("#c0392b"))
	_ui["e_atb"] = _bar(ep, Vector2(12, 66), Color("#f1c40f"), 10)
	_ui["e_hp_txt"] = _label(ep, Vector2(300, 6), "")
	# painel jogador
	var pp := _panel(root, Vector2(40, 330), Vector2(400, 120))
	_ui["p_name"] = _label(pp, Vector2(12, 6), "Yang Kai")
	_ui["p_hp"] = _bar(pp, Vector2(12, 36), Color("#27ae60"))
	_ui["p_qi"] = _bar(pp, Vector2(12, 62), Color("#2980b9"), 10)
	_ui["p_atb"] = _bar(pp, Vector2(12, 80), Color("#f1c40f"), 10)
	_ui["p_txt"] = _label(pp, Vector2(250, 6), "")
	# menu
	var mp := _panel(root, Vector2(700, 270), Vector2(230, 250))
	_menu_box = VBoxContainer.new()
	_menu_box.position = Vector2(10, 10)
	_menu_box.size = Vector2(210, 230)
	mp.add_child(_menu_box)
	# log
	var lp := _panel(root, Vector2(40, 460), Vector2(640, 70))
	_log_label = RichTextLabel.new()
	_log_label.position = Vector2(10, 6)
	_log_label.size = Vector2(620, 60)
	_log_label.scroll_following = true
	lp.add_child(_log_label)

func _panel(parent: Node, pos: Vector2, sz: Vector2) -> Panel:
	var p := Panel.new()
	p.position = pos
	p.size = sz
	parent.add_child(p)
	return p

func _label(parent: Node, pos: Vector2, text: String) -> Label:
	var l := Label.new()
	l.position = pos
	l.text = text
	parent.add_child(l)
	return l

func _bar(parent: Node, pos: Vector2, color: Color, height := 20) -> ProgressBar:
	var b := ProgressBar.new()
	b.position = pos
	b.size = Vector2(376, height)
	b.show_percentage = false
	b.max_value = 100
	var sb := StyleBoxFlat.new()
	sb.bg_color = color
	b.add_theme_stylebox_override("fill", sb)
	parent.add_child(b)
	return b

func _set_menu(options: Array) -> void:
	if _menu_box == null:
		return
	for c in _menu_box.get_children():
		_menu_box.remove_child(c)
		c.queue_free()
	var first: Button = null
	for o in options:
		var b := Button.new()
		b.text = o["text"]
		b.disabled = o.get("disabled", false)
		b.custom_minimum_size = Vector2(200, 44)
		b.pressed.connect(o["cb"])
		_menu_box.add_child(b)
		if first == null and not b.disabled:
			first = b
	if first != null and not auto_play:
		first.grab_focus()

func _refresh() -> void:
	if _ui.is_empty():
		return
	_ui["e_hp"].value = 100.0 * enemy["hp"] / enemy["max_hp"]
	_ui["e_atb"].value = enemy["atb"]
	_ui["e_hp_txt"].text = "HP %d/%d" % [enemy["hp"], enemy["max_hp"]]
	_ui["p_hp"].value = 100.0 * player["hp"] / player["max_hp"]
	_ui["p_qi"].value = 100.0 * player["qi"] / player["max_qi"]
	_ui["p_atb"].value = player["atb"]
	_ui["p_txt"].text = "HP %d/%d  Qi %d/%d" % [player["hp"], player["max_hp"], player["qi"], player["max_qi"]]

func _log(text: String) -> void:
	if _log_label != null:
		_log_label.append_text(text + "\n")
