extends CanvasLayer
## Caixa de dialogo. Uso: await Dialogue.play_id("cap01_intro")

signal _line_done

var active := false
var last_end_ms := 0

var _panel: Panel
var _speaker: Label
var _text: RichTextLabel
var _typing := false
var _chars := 0.0

func _ready() -> void:
	layer = 50
	process_mode = Node.PROCESS_MODE_ALWAYS
	_build()
	visible = false

func _build() -> void:
	_panel = Panel.new()
	_panel.anchor_left = 0.03
	_panel.anchor_right = 0.97
	_panel.anchor_top = 0.70
	_panel.anchor_bottom = 0.97
	add_child(_panel)
	_speaker = Label.new()
	_speaker.position = Vector2(16, 8)
	_speaker.add_theme_color_override("font_color", Color("#f1c40f"))
	_panel.add_child(_speaker)
	_text = RichTextLabel.new()
	_text.position = Vector2(16, 36)
	_text.size = Vector2(860, 100)
	_text.fit_content = false
	_text.scroll_active = false
	_panel.add_child(_text)
	_panel.resized.connect(func(): _text.size = Vector2(_panel.size.x - 32, _panel.size.y - 44))

func play_id(id: String) -> void:
	var lines: Array = DataDB.dialogues.get(id, [])
	if lines.is_empty():
		push_warning("Dialogo vazio ou ausente: " + id)
		return
	await play(lines)

func play(lines: Array) -> void:
	active = true
	visible = true
	for l in lines:
		_speaker.text = str(l.get("s", ""))
		_text.text = str(l.get("t", ""))
		_text.visible_characters = 0
		_chars = 0.0
		_typing = true
		await _line_done
	visible = false
	active = false
	last_end_ms = Time.get_ticks_msec()

func _process(delta: float) -> void:
	if active and _typing:
		_chars += 70.0 * delta
		_text.visible_characters = int(_chars)
		if _text.visible_characters >= _text.get_total_character_count():
			_typing = false

func _input(event: InputEvent) -> void:
	if not active:
		return
	var pressed := event.is_action_pressed("interact")
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		pressed = true
	if not pressed:
		return
	get_viewport().set_input_as_handled()
	if _typing:
		_typing = false
		_text.visible_characters = -1
	else:
		_line_done.emit()
