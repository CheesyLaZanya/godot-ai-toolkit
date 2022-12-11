extends Node

var date_location
var date_description
var date_feedback
var date_script
var date_script_file = "res://samples/sample_assets/sample_visual_novel/date.json"
var story_progress = 0
var story_text_label
var story_text_input
var date_image

func _ready():
	story_text_label = $"Story Panel/Story Text Label"
	story_text_input = $"Story Panel/Story Text Input"
	date_image = $"Date Image"
	date_script = ParameterUtility.load_json_data(date_script_file)
	update_story_panel()

func _input(ev):
	if Input.is_key_pressed(KEY_ENTER):
		update_story_panel()

func update_story_panel():
	story_text_label.text = date_script[story_progress].dialog
	
	if date_script[story_progress].input == true:
		story_text_input.show()
	else:
		story_text_input.hide()
	
	if date_script[story_progress].id == 6:
		date_image.show()
	
	story_progress = story_progress + 1
	


func _on_story_text_input_text_submitted(new_text):
	update_story_panel()
