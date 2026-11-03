extends "res://singletons/debug_service.gd"

const DEBUG_MENU_SCENE: PackedScene = preload("res://mods-unpacked/Yoko-DebugMenu/content/scenes/debug_menu.tscn")

var has_debug_menu: bool = false
var mod_debug_menu: PanelContainer = null
var _shortcut_was_pressed: bool = false

# ══════════════════════════════════════════ Extension ══════════════════════════════════════════ #
func _input(event: InputEvent) -> void:
    ._input(event)

    if not _is_shortcut_event(event):
        return

    var viewport: Viewport = get_viewport()
    var focused: Control = viewport.gui_get_focus_owner() if viewport else null
    if focused != null and (focused is LineEdit or focused is TextEdit):
        return

    var shortcut_pressed: bool = _is_shortcut_pressed()
    if not shortcut_pressed:
        _shortcut_was_pressed = false
        return

    if _shortcut_was_pressed:
        return

    _shortcut_was_pressed = true
    _toggle_mod_debug_menu()

func _is_shortcut_event(event: InputEvent) -> bool:
    if event is InputEventKey:
        return event.scancode == KEY_T or event.physical_scancode == KEY_T

    if event is InputEventJoypadButton:
        return event.device == 0 and event.button_index in [JOY_BUTTON_6, JOY_BUTTON_7]

    if event is InputEventJoypadMotion:
        return event.device == 0 and event.axis in [JOY_AXIS_6, JOY_AXIS_7]

    return false

func _is_shortcut_pressed() -> bool:
    if Input.is_physical_key_pressed(KEY_T):
        return true

    var triggers_pressed: bool = (
        Input.is_joy_button_pressed(0, JOY_BUTTON_6)
        and Input.is_joy_button_pressed(0, JOY_BUTTON_7)
    )
    if triggers_pressed:
        return true

    return Input.get_joy_axis(0, JOY_AXIS_6) > 0.5 and Input.get_joy_axis(0, JOY_AXIS_7) > 0.5

func _toggle_mod_debug_menu() -> void:
    if is_instance_valid(mod_debug_menu):
        has_debug_menu = false
        mod_debug_menu._on_cross_button_pressed()
        mod_debug_menu = null
        return

    has_debug_menu = false
    mod_debug_menu = null

    var current_scene: Node = get_tree().current_scene
    if current_scene == null:
        return

    var menu: PanelContainer = DEBUG_MENU_SCENE.instance()
    var parent: Node = current_scene
    if current_scene is Main:
        parent = current_scene.get_node_or_null("UI")
        if parent == null:
            menu.queue_free()
            return

    parent.add_child(menu)
    mod_debug_menu = menu
    has_debug_menu = true
