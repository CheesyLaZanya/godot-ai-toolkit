@tool
extends Panel


func _ready():
	hide_all_panels()


func hide_all_panels():
	$"OpenAI Panel".hide()
	$"Cohere Panel".hide()


func _on_ai_selection_item_selected(index):
	var selection = $"AI Selection Panel/AI Selection".get_item_text(index)

	hide_all_panels()

	if selection == "Choose an AI Provider":
		hide_all_panels()
	elif selection == "OpenAI":
		$"OpenAI Panel".show()
	elif selection == "co:here":
		$"Cohere Panel".show()
