extends CharacterBody2D
## Yang Kai no mapa. Movimento em 4/8 direcoes; interage com o mais proximo.

const SPEED := 150.0
const INTERACT_RANGE := 56.0

func _ready() -> void:
	var cs := CollisionShape2D.new()
	var rs := RectangleShape2D.new()
	rs.size = Vector2(18, 12)
	cs.shape = rs
	cs.position = Vector2(0, 8)
	add_child(cs)
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	if Dialogue.active or GameState.busy:
		velocity = Vector2.ZERO
		return
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = dir * SPEED
	move_and_slide()
	if Input.is_action_just_pressed("interact") \
			and Time.get_ticks_msec() - Dialogue.last_end_ms > 250:
		_try_interact()

func _try_interact() -> void:
	var best: Node = null
	var best_d := INTERACT_RANGE
	for n in get_tree().get_nodes_in_group("interactable"):
		if not n.enabled:
			continue
		var d := global_position.distance_to(n.global_position)
		if d < best_d:
			best = n
			best_d = d
	if best != null:
		best.interact()

func _draw() -> void:
	draw_rect(Rect2(-9, -14, 18, 28), Color("#3b6ea5"))
	draw_circle(Vector2(0, -20), 8, Color("#e8c9a0"))
	draw_line(Vector2(12, -10), Vector2(12, 18), Color("#7a5c2e"), 3.0)  # vassoura
