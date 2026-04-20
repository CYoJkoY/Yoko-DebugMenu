extends "res://singletons/debug_service.gd"

var mod_debug_menu = null

# =========================== Extension =========================== #
func _input(_event) -> void:
    if (!Input.is_physical_key_pressed(KEY_T) and \
            !(
                _event.is_action_pressed("ltrigger") or \
                _event.is_action_pressed("rtrigger")
              )
       ) or is_instance_valid(mod_debug_menu): return
    
    get_viewport().set_input_as_handled()

    mod_debug_menu = load("res://mods-unpacked/Yoko-DebugMenu/content/scenes/debug_menu.tscn").instance()
    if get_tree().current_scene is Main: get_tree().current_scene.get_node("UI").add_child(mod_debug_menu)
    else: get_tree().current_scene.add_child(mod_debug_menu)
