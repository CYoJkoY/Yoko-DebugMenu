extends "res://singletons/debug_service.gd"

var mod_debug_menu = null

# =========================== Extension =========================== #
func _input(event):
    ._input(event)

    if OS.is_debug_build() or !event.is_action_pressed("open_debug_menu"): return
    
    if is_instance_valid(mod_debug_menu): return

    mod_debug_menu = load("res://mods-unpacked/Yoko-DebugMenu/content/scenes/debug_menu.tscn").instance()
    if get_tree().current_scene is Main: get_tree().current_scene.get_node("UI").add_child(mod_debug_menu)
    else: get_tree().current_scene.add_child(mod_debug_menu)
