extends Node


func _ready():
	var name = "Bob"
	send_name_prompt(name)


func send_name_prompt(name):
	var prompt = "The following is a short commentary on a player naming themselves '%s' in a fantasy rpg: " % name

	OpenAIAPI.request_completed.connect(_get_name_response)
	OpenAIAPI.send_prompt(prompt)


func _get_name_response(status, message):
	if status == OK:
		print ("Successfully recieved %s" % message)
	else:
		print("Received status %s" % status)
		print("With message %s" % message)
