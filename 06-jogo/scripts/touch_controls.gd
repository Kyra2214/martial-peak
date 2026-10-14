extends CanvasLayer
## Controles na tela para celular. So aparece se houver tela de toque.

func _ready() -> void:
	layer = 30
	if not DisplayServer.is_touchscreen_available():
		visible = false
		return
	_btn("◀", Vector2(20, 400), "move_left")
	_btn("▶", Vector2(200, 400), "move_right")
	_btn("▲", Vector2(110, 330), "move_up")
	_btn("▼", Vector2(110, 440), "move_down")
	_btn("E", Vector2(820, 400), "interact")

func _btn(text: String, pos: Vector2, action: String) -> void:
	var b := Button.new()
	b.text = text
	b.position = pos
	b.custom_minimum_size = Vector2(80, 80)
	b.size = Vector2(80, 80)
	b.focus_mode = Control.FOCUS_NONE
	b.modulate = Color(1, 1, 1, 0.6)
	b.button_down.connect(func(): Input.action_press(action))
	b.button_up.connect(func(): Input.action_release(action))
	add_child(b)
