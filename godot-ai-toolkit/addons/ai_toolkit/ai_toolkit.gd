@tool
extends EditorPlugin

var dock
const openai_parameter_manager_autoload_name = "OpenAIParameterManager"

func _enter_tree():
    dock = preload("res://addons/ai_toolkit/AIConfiguration.tscn").instantiate()
	# add_autoload_singleton(openai_parameter_manager_autoload_name, "res://testscripts/openai_param_manager.gd")
    add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)


func _exit_tree():
    remove_control_from_docks(dock)
	# remove_autoload_singleton(openai_parameter_manager_autoload_name)
    dock.free()