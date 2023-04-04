@tool
extends Node

signal request_completed(status, predicition, confidence)

func analyze_sentiment(feedback, category, positive_examples, neutral_examples, negative_examples):
	var http_request = create_sentiment_request()
	
	var secrets = CohereParamManager.get_secrets()
	var global_parameters = CohereParamManager.get_parameters()
	
	var output_indicator = "Classify this %s feedback" % category
	var task_description = "Classify this %s feedback as positive, negative, or neutral" % category
	
	var inputs = [feedback]
	
	var examples = []
	
	for example in positive_examples:
		var details = {
			"text": example,
			"label": "positive %s" % category
		}
		examples.append(details)
		
	for example in neutral_examples:
		var details = {
			"text": example,
			"label": "neutral %s" % category
		}
		examples.append(details)
		
	for example in negative_examples:
		var details = {
			"text": example,
			"label": "negative %s" % category
		}
		examples.append(details)
	
	var body = JSON.new().stringify(
		{
			"model": global_parameters.model,
			"outputIndicator": output_indicator,
			"taskDescription": task_description,
			"examples": examples,
			"inputs": inputs
		})

	var cohere_api_key = EncryptionUtility.decrypt_api_key(secrets.api_key)
	
	var headers = ["Content-Type: application/json", "Authorization: Bearer %s" % cohere_api_key]

	var url = "https://api.cohere.ai/classify"
	
	print("Sending request to %s" % url)
	
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	# var error = OK
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func get_available_models():
	var available_models = ["small", "large"]
	
	return available_models


# Note: Don't make simultaneous requests using a single HTTPRequest node.
func create_sentiment_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._analysis_completed)
	
	return http_request


func _analysis_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	if response.has('classifications'):
		var prediction = response["classifications"][0]["prediction"]
		var confidence = float(response["classifications"][0]["confidence"])
		print(prediction)
		print(confidence)
		emit_signal("request_completed", ERR_UNCONFIGURED, prediction, confidence)
	elif response.has('message'):
		var message = response["message"]
		print(message)
		emit_signal("request_completed", ERR_UNCONFIGURED, message, 0.0)
