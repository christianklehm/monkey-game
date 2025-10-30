extends Button

func _on_pressed() -> void:
	get_node("../ps_active_plate_controller").clear_plate()
