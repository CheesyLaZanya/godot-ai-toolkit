extends Node


func _ready():
	var name = "Bob"
	send_name_prompt(name)
	
	
	var date_feedback = "I hated this date"
	send_date_feedback(date_feedback)
	

func send_name_prompt(name):
	var prompt = "The following is a short commentary on a player naming themselves '%s' in a fantasy rpg: " % name

	OpenAIAPI.request_completed.connect(_get_name_response)
	OpenAIAPI.send_prompt(prompt)


func send_date_feedback(date_feedback):
	var category = "date"
	
	var positive_examples = [
		"This date was great",
		"I had a lot of fun",
		"I liked it a lot",
		"I'm glad we had it"
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
		"I'm happy it is over"
	]
	
	CohereAPI.request_completed.connect(_get_date_prediction)
	CohereAPI.analyze_sentiment(date_feedback, category, positive_examples, neutral_examples, negative_examples)


func _get_name_response(status, message):
	if status == OK:
		print ("Successfully recieved %s" % message)
	else:
		print("Received status %s" % status)
		print("With message %s" % message)


func _get_date_prediction(status, prediction, confidence):
	if status == OK:
		print ("Successfully recieved %s" % prediction)
	else:
		print("Received status %s" % status)
		print("With message %s" % prediction)
