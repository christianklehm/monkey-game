extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed():
	$ButtonClick.play() # Uses signal from AudioStreamPlayer to play sound


func _on_button_click_finished() -> void: # Waits until sound finishes
	get_tree().quit()
