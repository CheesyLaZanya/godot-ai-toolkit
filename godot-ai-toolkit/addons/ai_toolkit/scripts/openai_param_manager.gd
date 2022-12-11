@tool
extends Node

var secrets = {
	api_key = "Secret"
}

var parameters = {
	gpt_model = "text-davinci-003",
	temperature = 0.7,
	max_tokens = 256,
	top_p = 1,
	frequency_penalty = 0,
	presence_penalty = 0
}

var secrets_loaded = false
var toolkit_path = "res://addons/ai_toolkit"
var secrets_folder_path = "/secrets/"
var secrets_file_path = toolkit_path + secrets_folder_path + "/openai.json"

var parameters_loaded = false
var parameters_file_path = "res://addons/ai_toolkit/parameters/openai.json"

func _ready():
	first_time_setup()


func first_time_setup():
	if not FileAccess.file_exists(secrets_file_path):
		var dir = DirAccess.open(toolkit_path)
		if not toolkit_path.dir_exists(secrets_folder_path):
			toolkit_path.make_dir(secrets_folder_path)
		set_api_key("Secret")
		secrets_loaded = true
	if not FileAccess.file_exists(parameters_file_path):
		save_parameters()
		parameters_loaded = true


func save_secrets():
	ParameterUtility.save_as_json(secrets, secrets_file_path)


func save_parameters():
	ParameterUtility.save_as_json(parameters, parameters_file_path)


func load_secrets():
	secrets = ParameterUtility.load_json_data(secrets_file_path)
	secrets_loaded = true

	# print_secrets()


func load_parameters():
	parameters = ParameterUtility.load_json_data(parameters_file_path)
	parameters_loaded = true

	print_parameters()


func get_secrets():
	if secrets_loaded == false:
		load_secrets()
	
	return secrets


func get_parameters():
	if parameters_loaded == false:
		load_parameters()
	
	return parameters


func print_secrets():
	print("encrypted api_key: %s" % secrets.api_key)


func print_parameters():
	print("gpt_model: %s" % parameters.gpt_model)
	print("temperature: %s" % parameters.temperature)
	print("max_tokens: %s" % parameters.max_tokens)
	print("top_p: %s" % parameters.top_p)
	print("frequency_penalty: %s" % parameters.frequency_penalty)
	print("presence_penalty: %s" % parameters.presence_penalty)


func set_api_key(new_api_key):
	var key = EncryptionUtility.get_encryption_key()
	var encrypted_key = EncryptionUtility.encrypt_data(key, new_api_key)
	secrets.api_key = encrypted_key
	save_secrets()


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
