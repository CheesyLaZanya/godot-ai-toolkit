extends Node

var user_input = ""
var ai_input = ""
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
	get_current_story()

func _input(ev):
	if Input.is_key_pressed(KEY_ENTER):
		if (date_script[story_progress].input == false):
			update_story_panel()

func get_id_from_tag(tag):
	for story_section in date_script:
		if story_section.has("tag"):
			if story_section.tag == tag:
				return story_section.id

func get_current_story():
	var updated_story = date_script[story_progress].dialog
	updated_story = updated_story.replace("[[USER_INPUT]]", user_input)
	updated_story = updated_story.replace("[[AI_INPUT]]", ai_input)
	updated_story = updated_story.strip_edges()
	
	story_text_label.text = updated_story
	
	if date_script[story_progress].input == true:
		story_text_input.show()
	else:
		story_text_input.hide()
		
	var appearance_id = get_id_from_tag("appearance")
	
	if date_script[story_progress].id == appearance_id:
		date_image_base.show()


func update_story_panel():
	var result_id = get_id_from_tag("result")
	
	if date_script[story_progress].id > result_id:
		var end_id = get_id_from_tag("ending")
		story_progress = end_id
	elif date_script[story_progress].id == result_id:
		set_response_based_on_feeling(ai_input)
	else:
		story_progress = story_progress + 1
		
	get_current_story()


func set_response_based_on_feeling(feeling):
	date_image_base.hide()
	
	var response_id = get_id_from_tag(feeling)
	
	if feeling == "positive date":
		date_image_positive.show()
		story_progress = response_id
	elif feeling == "negative date":
		date_image_negative.show()
		story_progress = response_id
	else:
		response_id = get_id_from_tag("neutral date")
		date_image_neutral.show()
		story_progress = response_id
	
	get_current_story()

func _on_story_text_input_text_submitted(new_text):
	user_input = new_text
	story_text_input.text = ""
	
	var date_location_id = get_id_from_tag("date location")
	var date_feedback_id = get_id_from_tag("date feedback")
	
	if date_script[story_progress].id == date_location_id:
		print("That was date location info")
		send_date_prompt(user_input)
	elif date_script[story_progress].id == date_feedback_id:
		print("That was date feedback info")
		send_date_feedback(user_input)
	else:
		printerr("Unknown input. ID was %s" % date_script[story_progress].id)
	
	update_story_panel()


func send_date_prompt(location):
	var prompt = "The following is a single line comment on us going to the '%s' for a date in the past in a visual novel including something they saw in a first person perspective: " % location

	OpenAIAPI.request_completed.connect(_get_date_response)
	OpenAIAPI.send_prompt(prompt)


func _get_date_response(status, message):
	if status == OK:
		print ("Successfully recieved %s" % message)
		ai_input = message.replace('"', "")
	else:
		print("Received status %s" % status)
		print("With message %s" % message)


func send_date_feedback(date_feedback):
	var category = "date"
	
	var positive_examples = [
		"This date was great",
		"I had a lot of fun",
		"I liked it a lot",
		"I'm glad we had it",
		"Great"
	]
	var neutral_examples = [
		"It was fine",
		"Whatever",
		"Eh",
		"That was a long day"
	]
	var negative_examples = [
		"You were so boring",
		"Go away",
		"This date was so dumb",
		"I'm happy it is over",
		"Awful"
	]
	
	CohereAPI.request_completed.connect(_get_date_prediction)
	CohereAPI.analyze_sentiment(date_feedback, category, positive_examples, neutral_examples, negative_examples)


func _get_date_prediction(status, prediction, confidence):
	print("Received status %s" % status)
	print("With message %s" % prediction)
	print("Confidence %s" % confidence)
	
	ai_input = prediction
