extends "res://ui/menus/debug/debug_menu.gd"

onready var cross_button: Button = $"%cross_button"

var focus_before_created: Control = null

# =========================== Extension =========================== #
func _on_cross_button_pressed() -> void:
	if is_instance_valid(focus_before_created): focus_before_created.grab_focus()
	queue_free()

func _ready() -> void:
	focus_before_created = get_focus_owner()
	cross_button.grab_focus()

	var enemies: Array = []
	for entity in ItemService.entities:
		if !(entity is ItemEnemy): continue

		enemies.append(entity)

	inventory_enemies._elements.set_elements(enemies)
