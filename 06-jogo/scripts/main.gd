extends Node
## Fluxo do prototipo: Capitulo de jogo 01 (provisorio, baseado no legado).
## [P] A ordem e a presenca de cada personagem dependem da conferencia no manhua.

const BattleScript := preload("res://scripts/battle.gd")
const WorldScript := preload("res://scripts/world_patio.gd")
const HudScript := preload("res://scripts/hud.gd")
const TouchScript := preload("res://scripts/touch_controls.gd")

# [AJUSTAR] estatisticas do duelo tutorial
const RIVAL := {"name": "Discípulo A", "hp": 90, "atk": 13, "def": 7, "vel": 7}

var world: Node2D
var hud: CanvasLayer

func _ready() -> void:
	hud = HudScript.new()
	add_child(hud)
	add_child(TouchScript.new())
	world = WorldScript.new()
	add_child(world)
	world.pile_swept.connect(_on_pile_swept)
	world.npc_talked.connect(_on_npc_talked)
	await get_tree().process_frame
	_start_chapter()

func _start_chapter() -> void:
	await Dialogue.play_id("cap01_intro")
	hud.set_objective("varra as 3 pilhas de folhas (0/3)")

func _on_pile_swept(count: int, total: int) -> void:
	hud.set_objective("varra as %d pilhas de folhas (%d/%d)" % [total, count, total])
	if count >= total:
		await Dialogue.play_id("cap01_sweep_done")
		GameState.add_points(int(DataDB.points["Varrer"]["pontos"]))
		world.spawn_npc("rival", "Discípulo A", Vector2(480, 250), Color("#a0522d"))
		hud.set_objective("fale com o Discípulo A")

func _on_npc_talked(id: String) -> void:
	match id:
		"rival":
			world.remove_npc("rival")
			await Dialogue.play_id("cap01_rival_challenge")
			await _run_duel()
		"responsavel":
			world.remove_npc("responsavel")
			await Dialogue.play_id("cap01_deadline")
			await Dialogue.play_id("cap01_end")
			hud.set_objective("fim do protótipo (próximo: Livro Negro)")

func _run_duel() -> void:
	GameState.busy = true
	var battle := BattleScript.new()
	add_child(battle)
	battle.start(RIVAL)
	var result: Dictionary = await battle.finished
	GameState.busy = false
	if result["won"]:
		GameState.add_points(int(DataDB.points["Luta vencida"]["pontos"]))
		await Dialogue.play_id("cap01_win")
	else:
		GameState.add_points(int(DataDB.points["Luta perdida"]["pontos"]))
		GameState.hp = maxi(1, int(GameState.max_hp * 0.2))
		GameState.changed.emit()
		await Dialogue.play_id("cap01_defeat_tree")
		GameState.add_item("pomada_cura", 1)
		await Dialogue.play_id("cap01_pomada")
	if GameState.add_xp(40):
		await Dialogue.play([{"s": "", "t": "Yang Kai subiu para o nível %d. [provisório]" % GameState.level}])
	world.spawn_npc("responsavel", "Responsável", Vector2(480, 175), Color("#5b3a8a"))
	hud.set_objective("fale com o Responsável (use Itens para curar-se)")
