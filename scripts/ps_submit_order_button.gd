extends Button

@onready var normal_icon = preload("res://assets/icons/CheckMarkIcon.png")
@onready var hover_icon = preload("res://assets/icons/CheckMarkIconHover.png")

func _ready() -> void:
	icon = normal_icon

func _on_pressed() -> void:
	if $"..".order_is_correct():
		$order_result_message.text = "Correct!"
		$order_result_message.position = Vector2(300, -200) #Coords relative to parent button
		$order_result_message.show()
		$correctSoundEffect.play()
		await get_tree().create_timer(0.8).timeout  # waits 0.8 seconds
		$order_result_message.hide()
		$"..".resolve_order()
		
		$"../ps_active_plate_controller/removeSinglePeanutSFX".volume_db = -80
		$"../ps_active_plate_controller".clear_plate()
		await get_tree().create_timer(0.8).timeout
		$"../ps_active_plate_controller/removeSinglePeanutSFX".volume_db = 0
		
	else:
		$order_result_message.text = "Incorrect"
		$order_result_message.position = Vector2(300, -200) #Coords relative to parent button
		$order_result_message.show()
		$incorrectSoundEffect.play()
		await get_tree().create_timer(1.0).timeout  # waits 1 second
		$order_result_message.hide()


func _on_mouse_entered() -> void:
	icon = hover_icon

func _on_mouse_exited() -> void:
	icon = normal_icon
