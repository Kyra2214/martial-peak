extends Node2D
## Algo com que o jogador interage (pilha de folhas, NPC).

var label := ""
var color := Color("#c9a227")
var size := Vector2(26, 26)
var kind := "pile"   # "pile" ou "npc"
var enabled := true
var callback := Callable()

func _ready() -> void:
	add_to_group("interactable")

func interact() -> void:
	if enabled and callback.is_valid():
		callback.call()

func set_enabled(value: bool) -> void:
	enabled = value
	visible = value
	queue_redraw()

func _draw() -> void:
	if kind == "npc":
		draw_rect(Rect2(-9, -16, 18, 28), color)
		draw_circle(Vector2(0, -22), 8, Color("#e8c9a0"))
	else:
		draw_circle(Vector2.ZERO, size.x / 2.0, color)
	if label != "":
		draw_string(ThemeDB.fallback_font, Vector2(-50, -34), label,
			HORIZONTAL_ALIGNMENT_CENTER, 100, 13, Color.WHITE)
