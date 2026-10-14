extends SceneTree
## Simula o capitulo inteiro: godot --headless --path 06-jogo -s tests/flow.gd

var dlg
var skipping := true

func _initialize() -> void:
	call_deferred("_run")

func _skip_loop() -> void:
	while skipping:
		if dlg.active:
			dlg._typing = false
			dlg._line_done.emit()
		await process_frame

func _run() -> void:
	dlg = root.get_node("Dialogue")
	var gs = root.get_node("GameState")
	var main = load("res://scenes/main.tscn").instantiate()
	root.add_child(main)
	_skip_loop()
	for i in 10:
		await process_frame
	for it in main.world.get_children():
		if it.has_method("interact") and it.kind == "pile":
			it.interact()
	for i in 10:
		await process_frame
	print("pontos apos varrer: ", gs.points)
	for it in main.world.get_children():
		if it.has_method("interact") and it.kind == "npc":
			it.interact()
	# duelo: esperar a batalha aparecer e jogar no automatico
	for i in 5:
		await process_frame
	var battle = null
	for c in main.get_children():
		if c.get_script() != null and c.get_script().resource_path.ends_with("battle.gd"):
			battle = c
	print("batalha criada: ", battle != null)
	battle.auto_play = true
	while is_instance_valid(battle) and battle.state != "over":
		await process_frame
	for i in 600:
		await process_frame
		if gs.inventory.has("pomada_cura") or gs.level > 1:
			if gs.level > 1 and i > 60:
				break
	print("nivel=", gs.level, " pontos=", gs.points, " pomadas=", gs.inventory.get("pomada_cura", 0))
	var npcs := 0
	for it in main.world.get_children():
		if it.has_method("interact") and it.kind == "npc":
			npcs += 1
			it.interact()
	for i in 30:
		await process_frame
	print("npcs finais: ", npcs)
	skipping = false
	quit(0)
