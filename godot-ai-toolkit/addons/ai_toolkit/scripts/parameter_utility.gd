@tool
extends Node

func save_as_json(data, file_path):
	var json = JSON.new().stringify(data, "\t")
	
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(json)


func load_json_data(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	var file_contents = file.get_as_text()
	
	var json_parser = JSON.new()
	var status = json_parser.parse(file_contents)
	
	return json_parser.get_data()
