@tool
extends Panel


func _on_temperature_slider_value_changed(value):
	$"Temperature Panel/Temperature Input".text = str(value)


func _on_temperature_input_text_submitted(new_text):
	if new_text.is_valid_float():
		$"Temperature Panel/Temperature Slider".value = new_text.to_float()


func _on_temperature_input_focus_exited():
	var input_text = $"Temperature Panel/Temperature Input".text
	_on_temperature_input_text_submitted(input_text)
