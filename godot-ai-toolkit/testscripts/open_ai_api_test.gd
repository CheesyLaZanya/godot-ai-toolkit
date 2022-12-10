extends Node

func _ready():

	var http_request = create_request()

	var gpt_model = "text-davinci-003"
	var name = "Bob"
	var prompt = "The following is a short commentary on a player naming themselves '%s' in a romantic visual novel: " % name
	var temperature = 0.7
	var max_tokens = 256
	var top_p = 1
	var frequency_penalty = 0
	var presence_penalty = 0
	
	var body = JSON.new().stringify(
		{
			"model": gpt_model,
			"prompt": prompt,
			"temperature": temperature,
			"max_tokens": max_tokens,
			"top_p": top_p,
			"frequency_penalty": frequency_penalty,
			"presence_penalty": presence_penalty
		})
	
	var open_ai_api_key = ""
	
	var headers = ["Content-Type: application/json", "Authorization: Bearer %s" % open_ai_api_key]
	
	var url = "https://api.openai.com/v1/completions"
	
	var error = http_request.request(url, headers, true, HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

# Note: Don't make simultaneous requests using a single HTTPRequest node.
func create_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	return http_request

func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	if response.has('error'):
		print(response["error"]["message"])
	if response.has('choices'):
		print(response["choices"][0]["text"])
