extends StaticBody2D
## Bloco solido simples (parede, predio, arvore) desenhado como retangulo.

var size := Vector2(64, 64)
var color := Color("#6b4f2a")
var label := ""

func _ready() -> void:
	var cs := CollisionShape2D.new()
	var rs := RectangleShape2D.new()
	rs.size = size
	cs.shape = rs
	add_child(cs)
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(-size / 2.0, size), color)
	if label != "":
		draw_string(ThemeDB.fallback_font, Vector2(-size.x / 2.0, 5), label,
			HORIZONTAL_ALIGNMENT_CENTER, size.x, 14, Color.WHITE)
