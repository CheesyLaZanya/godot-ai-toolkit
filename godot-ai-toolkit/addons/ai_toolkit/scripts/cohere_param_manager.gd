@tool
extends Node

var parameters = {
	api_key = "Secret",
	model = "medium"
}

var parameters_loaded = false

var parameters_file_path = "res://addons/ai_toolkit/parameters/cohere.json"

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
	print("model: %s" % parameters.model)


func set_api_key(new_api_key):
	var key = EncryptionUtility.get_encryption_key()
	var encrypted_key = EncryptionUtility.encrypt_data(key, new_api_key)
	parameters.api_key = encrypted_key
	save_parameters()


func set_model(new_model):
	parameters.model = new_model
	save_parameters()
