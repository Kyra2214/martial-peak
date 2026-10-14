extends CanvasLayer
## Controles na tela para celular e navegador.
## Ficam sempre visíveis para que a versão Web possa ser jogada por toque.

func _ready() -> void:
	layer = 30
	_ensure_input_actions()
	_btn("◀", Vector2(20, 400), "move_left")
	_btn("▶", Vector2(200, 400), "move_right")
	_btn("▲", Vector2(110, 330), "move_up")
	_btn("▼", Vector2(110, 440), "move_down")
	_btn("E\nINTERAGIR", Vector2(800, 400), "interact")
	var hint := Label.new()
	hint.text = "CONTROLES TOUCH ATIVOS"
	hint.position = Vector2(20, 505)
	hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.65))
	hint.add_theme_font_size_override("font_size", 12)
	add_child(hint)

func _ensure_input_actions() -> void:
	var keys := {
		"move_left": [KEY_A, KEY_LEFT],
		"move_right": [KEY_D, KEY_RIGHT],
		"move_up": [KEY_W, KEY_UP],
		"move_down": [KEY_S, KEY_DOWN],
		"interact": [KEY_E, KEY_SPACE, KEY_ENTER],
	}
	for action in keys:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for keycode in keys[action]:
			var event := InputEventKey.new()
			event.physical_keycode = keycode
			if not InputMap.action_has_event(action, event):
				InputMap.action_add_event(action, event)

func _btn(text: String, pos: Vector2, action: String) -> void:
	var b := Button.new()
	b.text = text
	b.position = pos
	b.custom_minimum_size = Vector2(80, 80)
	b.size = Vector2(80, 80)
	b.focus_mode = Control.FOCUS_NONE
	b.modulate = Color(1, 1, 1, 0.6)
	b.tooltip_text = "Toque para %s" % action
	b.button_down.connect(func(): Input.action_press(action))
	b.button_up.connect(func(): Input.action_release(action))
	add_child(b)
