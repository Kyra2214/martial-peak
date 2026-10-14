extends SceneTree
## Rodar: godot --headless --path 06-jogo -s tests/smoke.gd

func _initialize() -> void:
	call_deferred("_run")

func _run() -> void:
	var fails := 0
	var db = root.get_node("DataDB")
	var gs = root.get_node("GameState")
	fails += _check(db.attrs.size() == 10, "atributos carregados")
	fails += _check(db.techniques.has("Golpe Básico"), "tecnicas carregadas")
	fails += _check(db.items.has("pomada_cura"), "itens carregados")
	fails += _check(db.dialogues.has("cap01_intro"), "dialogos carregados")
	fails += _check(gs.max_hp == 60 and gs.atk == 8, "stats nivel 1")
	gs.add_item("pomada_cura", 1)
	gs.hp = 10
	gs.use_item("pomada_cura")
	fails += _check(gs.hp == 35, "pomada cura 25")
	fails += _check(gs.add_xp(40) and gs.level == 2, "xp sobe de nivel")
	# batalha automatica
	gs.apply_level(1, true)
	var Battle = load("res://scripts/battle.gd")
	var b = Battle.new()
	b.auto_play = true
	root.add_child(b)
	b.start({"name": "Teste", "hp": 30, "atk": 10, "def": 3, "vel": 6})
	var res: Dictionary = await b.finished
	fails += _check(res.has("won"), "batalha terminou: venceu=%s" % res.get("won"))
	# cena principal
	var main = load("res://scenes/main.tscn").instantiate()
	root.add_child(main)
	for i in 5:
		await process_frame
	fails += _check(root.get_node("Dialogue").active, "dialogo de abertura ativo")
	print("FALHAS: ", fails)
	quit(fails)

func _check(cond: bool, msg: String) -> int:
	print(("OK   " if cond else "FAIL ") + msg)
	return 0 if cond else 1
