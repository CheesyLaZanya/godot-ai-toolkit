extends Node

var user_input = ""
var ai_input = ""
var rpg_script
var rpg_script_file = "res://samples/sample_assets/sample_rpg/adventure.json"
var story_progress = 0
var story_text_label
var story_text_input
var rpg_researcher_image
var rpg_weapon_image

func _ready():
	story_text_label = $"Story Panel/Story Text Label"
	story_text_input = $"Story Panel/Story Text Input"
	rpg_researcher_image = $"RPG Researcher Image"
	rpg_weapon_image = $"RPG Weapon Image"
	
	rpg_script = ParameterUtility.load_json_data(rpg_script_file)
	get_current_story()

func _input(ev):
	if Input.is_key_pressed(KEY_ENTER):
		if (rpg_script[story_progress].input == false):
			update_story_panel()

func get_id_from_tag(tag):
	for story_section in rpg_script:
		if story_section.has("tag"):
			if story_section.tag == tag:
				return story_section.id

func get_current_story():
	var updated_story = rpg_script[story_progress].dialog
	updated_story = updated_story.replace("[[USER_INPUT]]", user_input)
	updated_story = updated_story.replace("[[AI_INPUT]]", ai_input)
	updated_story = updated_story.strip_edges()
	
	story_text_label.text = updated_story
	
	if rpg_script[story_progress].input == true:
		story_text_input.show()
	else:
		story_text_input.hide()
		
	var researcher_appearance_id = get_id_from_tag("researcher appearance")
	var researcher_reappearance_id = get_id_from_tag("researcher reappearance")
	var weapon_appearance_id = get_id_from_tag("weapon appearance")
	
	if rpg_script[story_progress].id == researcher_appearance_id:
		rpg_researcher_image.show()
		rpg_weapon_image.hide()
	
	if rpg_script[story_progress].id == researcher_reappearance_id:
		rpg_researcher_image.show()
		rpg_weapon_image.hide()
	
	if rpg_script[story_progress].id == weapon_appearance_id:
		rpg_researcher_image.hide()
		rpg_weapon_image.show()


func update_story_panel():
	var end_id = get_id_from_tag("ending")
	
	if rpg_script[story_progress].id == end_id:
		story_progress = end_id
	else:
		story_progress = story_progress + 1
		
	get_current_story()


func send_name_prompt(name):
	var prompt = "The following is a witty single line comment on the originality of a player naming themselves '%s' in a fantasy rpg: " % name

	OpenAIAPI.request_completed.connect(_get_name_response)
	OpenAIAPI.send_prompt(prompt)

func send_weapon_prompt(weapon):
	var prompt = "The following is a sarcastic single line comment on a player's weapon choice of '%s' in a fantasy rpg: " % weapon

	OpenAIAPI.request_completed.connect(_get_weapon_response)
	OpenAIAPI.send_prompt(prompt)

func _get_name_response(status, message):
	if status == OK:
		print ("Successfully recieved %s" % message)
		ai_input = message.replace('"', "")
	else:
		print("Received status %s" % status)
		print("With message %s" % message)


func _get_weapon_response(status, message):
	if status == OK:
		print ("Successfully recieved %s" % message)
		ai_input = message.replace('"', "")
	else:
		print("Received status %s" % status)
		print("With message %s" % message)


func _on_story_text_input_text_submitted(new_text):
	user_input = new_text
	story_text_input.text = ""
	
	var rpg_name_id = get_id_from_tag("name")
	var rpg_weapon_id = get_id_from_tag("weapon")
	
	if rpg_script[story_progress].id == rpg_name_id :
		print("That was rpg name info")
		send_name_prompt(user_input)
	elif rpg_script[story_progress].id == rpg_weapon_id:
		print("That was rpg weapon info")
		send_weapon_prompt(user_input)
	else:
		printerr("Unknown input. ID was %s" % rpg_script[story_progress].id)
	
	update_story_panel()
