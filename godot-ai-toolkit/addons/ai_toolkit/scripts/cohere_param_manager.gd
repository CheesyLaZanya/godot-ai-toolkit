@tool
extends Node

var secrets = {
	api_key = "Secret"
}

var parameters = {
	model = "medium"
}

var secrets_loaded = false
var secrets_file_path = "res://addons/ai_toolkit/secrets/cohere.json"

var parameters_loaded = false
var parameters_file_path = "res://addons/ai_toolkit/parameters/cohere.json"

func _ready():
	first_time_setup()


func first_time_setup():
	if not FileAccess.file_exists(secrets_file_path):
		save_secrets()
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

	print_secrets()


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
	print("model: %s" % parameters.model)


func set_api_key(new_api_key):
	var key = EncryptionUtility.get_encryption_key()
	var encrypted_key = EncryptionUtility.encrypt_data(key, new_api_key)
	secrets.api_key = encrypted_key
	save_secrets()


func set_model(new_model):
	parameters.model = new_model
	save_parameters()
