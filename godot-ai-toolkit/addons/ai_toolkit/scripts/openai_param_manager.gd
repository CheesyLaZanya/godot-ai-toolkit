@tool
extends Node

var parameters = {
	api_key = "Secret",
	gpt_model = "text-davinci-003",
	temperature = 0.7,
	max_tokens = 256,
	top_p = 1,
	frequency_penalty = 0,
	presence_penalty = 0
}

var parameters_loaded = false

var parameters_file_path = "res://parameters/openai"

func _ready():
	first_time_setup()

func first_time_setup():
	if not FileAccess.file_exists(parameters_file_path):
		save_parameters()
		parameters_loaded = true

func save_parameters():
	var parameters_json = JSON.new().stringify(parameters, "\t")
	
	var file = FileAccess.open(parameters_file_path, FileAccess.WRITE)
	file.store_string(parameters_json)


func load_parameters():
	var file = FileAccess.open(parameters_file_path, FileAccess.READ)
	
	var file_contents = file.get_as_text()
	
	var json_parser = JSON.new()
	var status = json_parser.parse(file_contents)
	
	parameters = json_parser.get_data()
	
	parameters_loaded = true

	print_parameters()


func get_parameters():
	if parameters_loaded == false:
		load_parameters()
	
	return parameters


func print_parameters():
	print("encrypted api_key: %s" % parameters.api_key)
	print("gpt_model: %s" % parameters.gpt_model)
	print("temperature: %s" % parameters.temperature)
	print("max_tokens: %s" % parameters.max_tokens)
	print("top_p: %s" % parameters.top_p)
	print("frequency_penalty: %s" % parameters.frequency_penalty)
	print("presence_penalty: %s" % parameters.presence_penalty)
	

func set_api_key(new_api_key):
	var key = EncryptionUtility.get_encryption_key()
	var encrypted_key = EncryptionUtility.encrypt_data(key, new_api_key)
	parameters.api_key = encrypted_key
	save_parameters()


func set_gpt_model(new_gpt_model):
	parameters.gpt_model = new_gpt_model
	save_parameters()


func set_temperature(new_temperature):
	parameters.temperature = new_temperature
	save_parameters()


func set_max_tokens(new_max_tokens):
	parameters.max_tokens = new_max_tokens
	save_parameters()


func set_top_p(new_top_p):
	parameters.top_p = new_top_p
	save_parameters()


func set_frequency_penalty(new_frequency_penalty):
	parameters.frequency_penalty = new_frequency_penalty
	save_parameters()


func set_presence_penalty(new_presence_penalty):
	parameters.presence_penalty = new_presence_penalty
	save_parameters()
