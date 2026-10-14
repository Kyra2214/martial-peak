extends Node
## Carrega os CSVs de res://data (copiados de 05-dados) e os dialogos JSON.
## Todos os valores numericos sao propostas [J] pendentes de balanceamento.

var attrs: Dictionary = {}       # nivel -> linha
var techniques: Dictionary = {}  # nome -> linha
var items: Dictionary = {}       # id -> linha
var points: Dictionary = {}      # atividade -> linha
var dialogues: Dictionary = {}   # id -> Array de {s, t}

func _ready() -> void:
	attrs = _load_csv("res://data/atributos_yang_kai.csv", "nivel")
	techniques = _load_csv("res://data/tecnicas.csv", "nome")
	items = _load_csv("res://data/itens.csv", "id")
	points = _load_csv("res://data/pontos.csv", "atividade")
	for chapter in ["cap01"]:
		_load_dialogues("res://data/dialogos/%s.json" % chapter)

func _load_csv(path: String, key: String) -> Dictionary:
	var out: Dictionary = {}
	var f := FileAccess.open(path, FileAccess.READ)
	if f == null:
		push_error("CSV nao encontrado: " + path)
		return out
	var headers := f.get_csv_line()
	while not f.eof_reached():
		var row := f.get_csv_line()
		if row.size() < headers.size():
			continue
		var d: Dictionary = {}
		for i in headers.size():
			d[headers[i]] = row[i]
		out[d[key]] = d
	return out

func _load_dialogues(path: String) -> void:
	var f := FileAccess.open(path, FileAccess.READ)
	if f == null:
		push_error("Dialogo nao encontrado: " + path)
		return
	var parsed: Variant = JSON.parse_string(f.get_as_text())
	if parsed is Dictionary:
		dialogues.merge(parsed, true)
	else:
		push_error("JSON invalido: " + path)

func level_stats(level: int) -> Dictionary:
	return attrs.get(str(level), {})
