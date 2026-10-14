extends CanvasLayer
## HUD: nivel, HP, Qi, pontos, objetivo e menu de itens.

var _stats: Label
var _objective: Label
var _items_btn: Button
var _inv_panel: Panel
var _inv_list: VBoxContainer

func _ready() -> void:
	layer = 10
	_stats = Label.new()
	_stats.position = Vector2(12, 8)
	add_child(_stats)
	_objective = Label.new()
	_objective.position = Vector2(12, 34)
	_objective.add_theme_color_override("font_color", Color("#f1c40f"))
	add_child(_objective)
	_items_btn = Button.new()
	_items_btn.text = "Itens"
	_items_btn.position = Vector2(850, 8)
	_items_btn.size = Vector2(96, 44)
	_items_btn.focus_mode = Control.FOCUS_NONE
	_items_btn.pressed.connect(_toggle_inventory)
	add_child(_items_btn)
	_build_inventory()
	GameState.changed.connect(_update)
	_update()

func set_objective(text: String) -> void:
	_objective.text = "Objetivo: " + text if text != "" else ""

func _update() -> void:
	_stats.text = "Nv %d   HP %d/%d   Qi %d/%d   Pontos %d" % [
		GameState.level, GameState.hp, GameState.max_hp,
		GameState.qi, GameState.max_qi, GameState.points]
	if _inv_panel.visible:
		_refresh_inventory()

func _build_inventory() -> void:
	_inv_panel = Panel.new()
	_inv_panel.position = Vector2(300, 120)
	_inv_panel.size = Vector2(360, 280)
	_inv_panel.visible = false
	add_child(_inv_panel)
	var title := Label.new()
	title.text = "Itens"
	title.position = Vector2(16, 10)
	_inv_panel.add_child(title)
	_inv_list = VBoxContainer.new()
	_inv_list.position = Vector2(16, 44)
	_inv_list.size = Vector2(328, 180)
	_inv_panel.add_child(_inv_list)
	var close := Button.new()
	close.text = "Fechar"
	close.position = Vector2(130, 230)
	close.size = Vector2(100, 36)
	close.pressed.connect(func(): _inv_panel.visible = false)
	_inv_panel.add_child(close)

func _toggle_inventory() -> void:
	if Dialogue.active or GameState.busy:
		return
	_inv_panel.visible = not _inv_panel.visible
	if _inv_panel.visible:
		_refresh_inventory()

func _refresh_inventory() -> void:
	for c in _inv_list.get_children():
		_inv_list.remove_child(c)
		c.queue_free()
	var any := false
	for id in GameState.inventory:
		var qty := int(GameState.inventory[id])
		if qty <= 0 or not DataDB.items.has(id):
			continue
		any = true
		var item: Dictionary = DataDB.items[id]
		var b := Button.new()
		b.text = "%s x%d  (usar)" % [item["nome"], qty]
		b.pressed.connect(func(): GameState.use_item(id))
		_inv_list.add_child(b)
	if not any:
		var l := Label.new()
		l.text = "Nenhum item."
		_inv_list.add_child(l)
