extends Button

func _on_pressed() -> void:
	Global.current_day += 1
	get_tree().change_scene_to_file("res://scenes/play_scene.tscn")
