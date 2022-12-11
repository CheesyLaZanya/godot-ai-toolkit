@tool
extends Node

func analyze_sentiment(response):
	var http_request = create_sentiment_request()
	var global_parameters = CohereParamManager.get_parameters()
	
	var output_indicator = "Classify this date feedback"
	var task_description = "Classify this date feedback as positive, negative, or neutral"
	
	var inputs = ["I'm glad we finally had our date."]
	
	var positive_examples = []
	var neutral_examples = []
	var negative_examples = []
	
	var examples = []
	
	var body = JSON.new().stringify(
		{
			"model": global_parameters.model,
			"outputIndicator": output_indicator,
			"taskDescription": task_description,
			"examples": examples,
			"inputs": inputs
		})

	var cohere_api_key = EncryptionUtility.decrypt_api_key(global_parameters.api_key)
	
	var headers = ["Content-Type: application/json", "Authorization: Bearer %s" % cohere_api_key]

	var url = "https://api.cohere.ai/classify"
	
	print("Sending request to %s" % url)
	
	# var error = http_request.request(url, headers, true, HTTPClient.METHOD_POST, body)
	var error = OK
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func get_available_models():
	var available_models = ["small", "medium", "large"]
	
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
		print(response["classifications"][0]["prediction"])
		print(response["classifications"][0]["confidence"])
	elif response.has('message'):
		print(response["message"])
