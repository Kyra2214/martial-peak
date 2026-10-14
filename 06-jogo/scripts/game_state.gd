extends Node
## Estado global: atributos de Yang Kai, pontos, inventario, flags.

signal changed

const XP_PER_LEVEL := 40  # [J] provisorio

var level := 1
var xp := 0
var points := 0
var max_hp := 60
var hp := 60
var max_qi := 20
var qi := 20
var atk := 8
var def := 5
var vel := 6
var inventory: Dictionary = {}
var flags: Dictionary = {}
var busy := false

func _ready() -> void:
	_setup_input()
	apply_level(1, true)

func _setup_input() -> void:
	var map := {
		"move_left": [KEY_A, KEY_LEFT],
		"move_right": [KEY_D, KEY_RIGHT],
		"move_up": [KEY_W, KEY_UP],
		"move_down": [KEY_S, KEY_DOWN],
		"interact": [KEY_E, KEY_SPACE, KEY_ENTER],
	}
	for action in map:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for k in map[action]:
			var ev := InputEventKey.new()
			ev.physical_keycode = k
			InputMap.action_add_event(action, ev)

func apply_level(new_level: int, full_heal: bool = false) -> void:
	var row: Dictionary = DataDB.level_stats(new_level)
	if row.is_empty():
		return
	level = new_level
	max_hp = int(row["hp"])
	max_qi = int(row["qi"])
	atk = int(row["atk"])
	def = int(row["def"])
	vel = int(row["vel"])
	if full_heal:
		hp = max_hp
		qi = max_qi
	hp = mini(hp, max_hp)
	qi = mini(qi, max_qi)
	changed.emit()

## Devolve true se subiu de nivel.
func add_xp(amount: int) -> bool:
	xp += amount
	var leveled := false
	while xp >= XP_PER_LEVEL * level and DataDB.level_stats(level + 1).size() > 0:
		xp -= XP_PER_LEVEL * level
		apply_level(level + 1, false)
		leveled = true
	changed.emit()
	return leveled

func add_points(amount: int) -> void:
	points += amount
	changed.emit()

func add_item(id: String, qty: int = 1) -> void:
	inventory[id] = int(inventory.get(id, 0)) + qty
	changed.emit()

func use_item(id: String) -> String:
	if int(inventory.get(id, 0)) <= 0 or not DataDB.items.has(id):
		return ""
	var item: Dictionary = DataDB.items[id]
	if item["tipo"] == "cura":
		hp = mini(max_hp, hp + int(item["efeito_hp"]))
	inventory[id] = int(inventory[id]) - 1
	changed.emit()
	return "%s usada." % item["nome"]

func set_flag(name: String, value: Variant = true) -> void:
	flags[name] = value

func has_flag(name: String) -> bool:
	return bool(flags.get(name, false))
