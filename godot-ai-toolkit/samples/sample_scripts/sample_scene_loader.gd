extends Control


func _on_visual_novel_sample_button_button_up():
	$SampleScreenPanel/RPGDescriptionPanel.hide()
	$SampleScreenPanel/VisualNovelDescriptionPanel.show()


func _on_rpg_sample_button_button_up():
	$SampleScreenPanel/RPGDescriptionPanel.show()
	$SampleScreenPanel/VisualNovelDescriptionPanel.hide()



func _on_visual_novel_start_button_up():
	get_tree().change_scene_to_file("res://samples/sample_scenes/sample_visual_novel.tscn")


func _on_rpg_start_button_up():
	get_tree().change_scene_to_file("res://samples/sample_scenes/sample_rpg.tscn")
