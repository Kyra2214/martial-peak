extends Node2D
## Patio do Pavilhao do Alto Ceu (placeholder grafico).
## Local exato e enquadramento sao [P] ate a conferencia com o manhua.

signal pile_swept(count: int, total: int)
signal npc_talked(id: String)

const W := 960.0
const H := 540.0
const BlockScript := preload("res://scripts/block.gd")
const InteractScript := preload("res://scripts/interactable.gd")
const PlayerScript := preload("res://scripts/player.gd")

var player: CharacterBody2D
var piles_swept := 0
var total_piles := 3
var _npcs: Dictionary = {}

func _ready() -> void:
	_build_map()
	player = PlayerScript.new()
	player.position = Vector2(480, 470)
	add_child(player)

func _draw() -> void:
	draw_rect(Rect2(0, 0, W, H), Color("#7d8f5a"))              # grama
	draw_rect(Rect2(300, 130, 360, 410), Color("#b9ad8c"))      # patio de pedra
	draw_rect(Rect2(440, 130, 80, 410), Color("#a39874"))       # caminho central

func _add_block(pos: Vector2, size: Vector2, color: Color, label := "") -> void:
	var b := BlockScript.new()
	b.position = pos
	b.size = size
	b.color = color
	b.label = label
	add_child(b)

func _build_map() -> void:
	# bordas
	_add_block(Vector2(W / 2, -10), Vector2(W, 20), Color("#2c3e2f"))
	_add_block(Vector2(W / 2, H + 10), Vector2(W, 20), Color("#2c3e2f"))
	_add_block(Vector2(-10, H / 2), Vector2(20, H), Color("#2c3e2f"))
	_add_block(Vector2(W + 10, H / 2), Vector2(20, H), Color("#2c3e2f"))
	# pavilhao (predio principal)
	_add_block(Vector2(480, 75), Vector2(520, 110), Color("#6b4f2a"), "Pavilhão do Alto Céu")
	# arvores
	_add_block(Vector2(120, 140), Vector2(60, 60), Color("#2f5d34"), "Árvore")
	_add_block(Vector2(820, 420), Vector2(60, 60), Color("#2f5d34"), "Árvore")
	_add_block(Vector2(150, 400), Vector2(60, 60), Color("#2f5d34"))
	# pilhas de folhas para varrer
	var spots := [Vector2(360, 250), Vector2(600, 330), Vector2(400, 420)]
	for p in spots:
		var it := InteractScript.new()
		it.position = p
		it.label = "Folhas"
		it.kind = "pile"
		it.callback = _sweep.bind(it)
		add_child(it)

func _sweep(it: Node2D) -> void:
	it.set_enabled(false)
	piles_swept += 1
	pile_swept.emit(piles_swept, total_piles)

func spawn_npc(id: String, display_name: String, pos: Vector2, color: Color) -> void:
	var n := InteractScript.new()
	n.position = pos
	n.label = display_name
	n.kind = "npc"
	n.color = color
	n.callback = func(): npc_talked.emit(id)
	add_child(n)
	_npcs[id] = n

func remove_npc(id: String) -> void:
	if _npcs.has(id):
		_npcs[id].queue_free()
		_npcs.erase(id)
