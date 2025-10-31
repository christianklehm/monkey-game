extends Button
	
func _on_pressed():
	$ButtonClick.play() # Uses signal from AudioStreamPlayer to play sound


func _on_button_click_finished() -> void: # Waits until sound finishes
	get_tree().quit()
