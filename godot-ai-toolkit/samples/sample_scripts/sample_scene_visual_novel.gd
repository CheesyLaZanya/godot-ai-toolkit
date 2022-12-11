extends Node

var user_input = ""
var ai_input = "AI input here"
var date_script
var date_script_file = "res://samples/sample_assets/sample_visual_novel/date.json"
var story_progress = 0
var story_text_label
var story_text_input
var date_image_base
var date_image_neutral
var date_image_positive
var date_image_negative

func _ready():
	story_text_label = $"Story Panel/Story Text Label"
	story_text_input = $"Story Panel/Story Text Input"
	date_image_base = $"Date Image Base"
	date_image_neutral = $"Date Image Neutral"
	date_image_positive = $"Date Image Positive"
	date_image_negative = $"Date Image Negative"
	
	date_script = ParameterUtility.load_json_data(date_script_file)
	update_story_panel()

func _input(ev):
	if Input.is_key_pressed(KEY_ENTER):
		if (date_script[story_progress - 1].input == false):
			update_story_panel()


func update_story_panel():
	var updated_story = date_script[story_progress].dialog
	updated_story = updated_story.replace("[[USER_INPUT]]", user_input)
	updated_story = updated_story.replace("[[AI_INPUT]]", ai_input)
	
	story_text_label.text = updated_story
	
	if date_script[story_progress].input == true:
		story_text_input.show()
	else:
		story_text_input.hide()
	
	if date_script[story_progress].id == 6:
		date_image_base.show()
	
	if date_script[story_progress].id == 13:
		set_response_based_on_feeling("negative date")
	
	if date_script[story_progress].id >= 14:
		story_progress = 17
	else:
		story_progress = story_progress + 1


func set_response_based_on_feeling(feeling):
	date_image_base.hide()
	
	if feeling == "positive date":
		date_image_positive.show()
		story_progress = 14
	elif feeling == "negative date":
		date_image_negative.show()
		story_progress = 16
	else:
		date_image_neutral.show()
		story_progress = 15
	
	update_story_panel()

func _on_story_text_input_text_submitted(new_text):
	user_input = new_text
	story_text_input.text = ""
	
	# send AI user input here
	
	update_story_panel()
