@tool
extends Panel

var temperature_input_node
var temperature_slider_node
var max_tokens_input_node
var max_tokens_slider_node


func _ready():
	temperature_input_node = $"Temperature Panel/Temperature Input"
	temperature_slider_node = $"Temperature Panel/Temperature Slider"
	max_tokens_input_node = $"Max Tokens Panel/Max Tokens Input"
	max_tokens_slider_node = $"Max Tokens Panel/Max Tokens Slider"


func update_slider_float_value(slider_node, value):
	if value.is_valid_float():
		slider_node.value = value.to_float()


func update_slider_int_value(slider_node, value):
	if value.is_valid_int():
		slider_node.value = value.to_int()


func update_slider_input(input_node, value):
	input_node.text = str(value)
	

func _on_temperature_slider_value_changed(value):
	update_slider_input(temperature_input_node, value)


func _on_temperature_input_text_submitted(new_text):
	update_slider_float_value(temperature_slider_node, new_text)


func _on_temperature_input_focus_exited():
	var input_text = temperature_input_node.text
	update_slider_float_value(temperature_slider_node, input_text)


func _on_max_tokens_slider_value_changed(value):
	update_slider_input(max_tokens_input_node, value)


func _on_max_tokens_input_text_submitted(new_text):
	update_slider_int_value(max_tokens_slider_node, new_text)


func _on_max_tokens_input_focus_exited():
	var input_text = max_tokens_input_node.text
	update_slider_int_value(max_tokens_slider_node, input_text)


