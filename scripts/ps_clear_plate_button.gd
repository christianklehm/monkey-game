extends Button

func _on_pressed() -> void:
	$BinSFX.play()
	get_node("../ps_active_plate_controller").clear_plate()
