extends Node

var api_key = "test"
var gpt_model = "text-davinci-003"
var temperature = 0.7
var max_tokens = 256
var top_p = 1
var frequency_penalty = 0
var presence_penalty = 0

var param_file_path = "res://parameters/openai"

func _ready():
	if not FileAccess.file_exists(param_file_path):
		save_params()
	
	load_params()

func save_params():
	var parameters = JSON.new().stringify(
		{
			"api_key": api_key,
			"gpt_model": gpt_model,
			"temperature": temperature,
			"max_tokens": max_tokens,
			"top_p": top_p,
			"frequency_penalty": frequency_penalty,
			"presence_penalty": presence_penalty
		}, "\t")
	
	var file = FileAccess.open(param_file_path, FileAccess.WRITE)
	file.store_string(parameters)

func load_params():
	var file = FileAccess.open(param_file_path, FileAccess.READ)
	
	var file_contents = file.get_as_text()
	
	var json_parser = JSON.new()
	var status = json_parser.parse(file_contents)
	
	var parameters = json_parser.get_data()
	
	api_key = parameters.api_key
	gpt_model = parameters.gpt_model
	temperature = parameters.temperature
	max_tokens = parameters.max_tokens
	top_p = parameters.top_p
	frequency_penalty = parameters.frequency_penalty
	presence_penalty = parameters.presence_penalty

	print_params()

func print_params():
	print("api_key: %s" % api_key)
	print("gpt_model: %s" % gpt_model)
	print("temperature: %s" % temperature)
	print("max_tokens: %s" % max_tokens)
	print("top_p: %s" % top_p)
	print("frequency_penalty: %s" % frequency_penalty)
	print("presence_penalty: %s" % presence_penalty)
