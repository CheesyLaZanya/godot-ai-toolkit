extends Node

var parameters = {
	api_key = "test",
	gpt_model = "text-davinci-003",
	temperature = 0.7,
	max_tokens = 256,
	top_p = 1,
	frequency_penalty = 0,
	presence_penalty = 0
}

var param_file_path = "res://parameters/openai"

func _ready():
	if not FileAccess.file_exists(param_file_path):
		save_params()
	
	load_params()

func save_params():
	var parameters_json = JSON.new().stringify(parameters, "\t")
	
	var file = FileAccess.open(param_file_path, FileAccess.WRITE)
	file.store_string(parameters_json)

func load_params():
	var file = FileAccess.open(param_file_path, FileAccess.READ)
	
	var file_contents = file.get_as_text()
	
	var json_parser = JSON.new()
	var status = json_parser.parse(file_contents)
	
	parameters = json_parser.get_data()

	print_params()

func print_params():
	print("api_key: %s" % parameters.api_key)
	print("gpt_model: %s" % parameters.gpt_model)
	print("temperature: %s" % parameters.temperature)
	print("max_tokens: %s" % parameters.max_tokens)
	print("top_p: %s" % parameters.top_p)
	print("frequency_penalty: %s" % parameters.frequency_penalty)
	print("presence_penalty: %s" % parameters.presence_penalty)
