extends Button
class_name DialogueAction


export (PackedScene) var dialogue_box
export (String, FILE, "*.json") var dialogue_file_path : String


func play_dialogue(data):
	dialogue_box.start(data)
	yield(dialogue_box, "dialogue_ended")

func load_dialogue(file_path) -> Dictionary:
	"""
	Parses a Json file and returns it as a dictionary
	"""
	var file = File.new()
	assert file.file_exists(file_path)
	
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert dialogue.size() > 0
	return dialogue

func _on_Button_pressed():
	var dialogue : Dictionary = load_dialogue(dialogue_file_path)
	yield(play_dialogue(dialogue), 'completed')
	emit_signal("finished")