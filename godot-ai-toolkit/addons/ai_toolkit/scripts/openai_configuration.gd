@tool
extends Panel

var api_key_input_node
var gpt_model_input_node
var temperature_input_node
var temperature_slider_node
var max_tokens_input_node
var max_tokens_slider_node
var top_p_input_node
var top_p_slider_node
var frequency_penalty_input_node
var frequency_penalty_slider_node
var presence_penalty_input_node
var presence_penalty_slider_node


func _ready():
	api_key_input_node = $"API Key Panel/API Key Input"
	gpt_model_input_node = $"GPT Model Panel/GPT Model Dropdown"
	temperature_input_node = $"Temperature Panel/Temperature Input"
	temperature_slider_node = $"Temperature Panel/Temperature Slider"
	max_tokens_input_node = $"Max Tokens Panel/Max Tokens Input"
	max_tokens_slider_node = $"Max Tokens Panel/Max Tokens Slider"
	top_p_input_node = $"Top P Panel/Top P Input"
	top_p_slider_node = $"Top P Panel/Top P Slider"
	frequency_penalty_input_node = $"Frequency Penalty Panel/Frequency Penalty Input"
	frequency_penalty_slider_node = $"Frequency Penalty Panel/Frequency Penalty Slider"
	presence_penalty_input_node = $"Presence Penalty Panel/Presence Penalty Input"
	presence_penalty_slider_node = $"Presence Penalty Panel/Presence Penalty Slider"
	
	load_gpt_model_input_list()
	load_configuration_values()


func load_configuration_values():
	var openai_global_parameters = OpenAIParamManager.get_parameters()
	
	api_key_input_node.text = EncryptionUtility.decrypt_api_key(openai_global_parameters.api_key)
	
	var models = OpenAIAPI.get_available_models()
	var gpt_model_input_index = models.find(openai_global_parameters.gpt_model, 0)
	gpt_model_input_node.select(gpt_model_input_index)
	
	temperature_input_node.text = str(openai_global_parameters.temperature)
	temperature_slider_node.value = float(openai_global_parameters.temperature)
	
	max_tokens_input_node.text = str(openai_global_parameters.max_tokens)
	max_tokens_slider_node.value = int(openai_global_parameters.max_tokens)
	
	top_p_input_node.text = str(openai_global_parameters.top_p)
	top_p_slider_node.value = float(openai_global_parameters.top_p)
	
	frequency_penalty_input_node.text = str(openai_global_parameters.frequency_penalty)
	frequency_penalty_slider_node.value = float(openai_global_parameters.frequency_penalty)
	
	presence_penalty_input_node.text = str(openai_global_parameters.presence_penalty)
	presence_penalty_slider_node.value = float(openai_global_parameters.presence_penalty)

func load_gpt_model_input_list():
	var models = OpenAIAPI.get_available_models()
	gpt_model_input_node.clear()
	
	for model in models:
		gpt_model_input_node.add_item(model, models.find(model,0))

func update_slider_float_value(slider_node, value):
	if value.is_valid_float():
		slider_node.value = value.to_float()


func update_slider_int_value(slider_node, value):
	if value.is_valid_int():
		slider_node.value = value.to_int()


func update_slider_input(input_node, value):
	input_node.text = str(value)


func _on_api_key_input_text_submitted(new_text):
	OpenAIParamManager.set_api_key(new_text)


func _on_api_key_input_focus_exited():
	var input_text = api_key_input_node.text
	OpenAIParamManager.set_api_key(input_text)


func _on_gpt_model_dropdown_item_selected(index):
	var input_text = gpt_model_input_node.get_item_text(index)
	OpenAIParamManager.set_gpt_model(input_text)


func _on_temperature_slider_value_changed(value):
	update_slider_input(temperature_input_node, value)
	OpenAIParamManager.set_temperature(value)


func _on_temperature_input_text_submitted(new_text):
	update_slider_float_value(temperature_slider_node, new_text)
	OpenAIParamManager.set_temperature(new_text)


func _on_temperature_input_focus_exited():
	var input_text = temperature_input_node.text
	update_slider_float_value(temperature_slider_node, input_text)
	OpenAIParamManager.set_temperature(input_text)


func _on_max_tokens_slider_value_changed(value):
	update_slider_input(max_tokens_input_node, value)
	OpenAIParamManager.set_max_tokens(value)


func _on_max_tokens_input_text_submitted(new_text):
	update_slider_int_value(max_tokens_slider_node, new_text)
	OpenAIParamManager.set_max_tokens(new_text)


func _on_max_tokens_input_focus_exited():
	var input_text = max_tokens_input_node.text
	update_slider_int_value(max_tokens_slider_node, input_text)
	OpenAIParamManager.set_max_tokens(input_text)


func _on_top_p_slider_value_changed(value):
	update_slider_input(top_p_input_node, value)
	OpenAIParamManager.set_top_p(value)


func _on_top_p_input_text_submitted(new_text):
	update_slider_float_value(top_p_slider_node, new_text)
	OpenAIParamManager.set_top_p(new_text)


func _on_top_p_input_focus_exited():
	var input_text = top_p_input_node.text
	update_slider_float_value(top_p_slider_node, input_text)
	OpenAIParamManager.set_top_p(input_text)


func _on_frequency_penalty_slider_value_changed(value):
	update_slider_input(frequency_penalty_input_node, value)
	OpenAIParamManager.set_frequency_penalty(value)


func _on_frequency_penalty_input_text_submitted(new_text):
	update_slider_float_value(frequency_penalty_slider_node, new_text)
	OpenAIParamManager.set_frequency_penalty(new_text)


func _on_frequency_penalty_input_focus_exited():
	var input_text = frequency_penalty_input_node.text
	update_slider_float_value(frequency_penalty_slider_node, input_text)
	OpenAIParamManager.set_frequency_penalty(input_text)


func _on_presence_penalty_slider_value_changed(value):
	update_slider_input(presence_penalty_input_node, value)
	OpenAIParamManager.set_presence_penalty(value)


func _on_presence_penalty_input_text_submitted(new_text):
	update_slider_float_value(presence_penalty_slider_node, new_text)
	OpenAIParamManager.set_presence_penalty(new_text)


func _on_presence_penalty_input_focus_exited():
	var input_text = presence_penalty_input_node.text
	update_slider_float_value(presence_penalty_slider_node, input_text)
	OpenAIParamManager.set_presence_penalty(input_text )

