@tool
extends Panel


var api_key_input_node
var model_input_node


func _ready():
	api_key_input_node = $"API Key Panel/API Key Input"
	model_input_node = $"Model Panel/Model Dropdown"
	
	load_model_input_list()
	load_configuration_values()


func load_configuration_values():
	var cohere_secrets = CohereParamManager.get_secrets()
	var cohere_global_parameters = CohereParamManager.get_parameters()
	
	api_key_input_node.text = EncryptionUtility.decrypt_api_key(cohere_secrets.api_key)
	
	var models = CohereAPI.get_available_models()
	var model_input_index = models.find(cohere_global_parameters.model, 0)
	model_input_node.select(model_input_index)
	

func load_model_input_list():
	var models = CohereAPI.get_available_models()
	model_input_node.clear()
	
	for model in models:
		model_input_node.add_item(model, models.find(model,0))


func _on_api_key_input_text_submitted(new_text):
	CohereParamManager.set_api_key(new_text)
	

func _on_api_key_input_focus_exited():
	var input_text = api_key_input_node.text
	CohereParamManager.set_api_key(input_text)


func _on_model_dropdown_item_selected(index):
	var input_text = model_input_node.get_item_text(index)
	CohereParamManager.set_model(input_text)
