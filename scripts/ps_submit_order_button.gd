extends Button

func _on_pressed() -> void:
	if $"..".order_is_correct():
		$order_result_message.text = "Correct!"
		$order_result_message.position = Vector2(400, -200) #Coords relative to parent button
		$order_result_message.show()
		await get_tree().create_timer(1.0).timeout  # waits 1 second
		$order_result_message.hide()
	else:
		$order_result_message.text = "Incorrect"
		$order_result_message.position = Vector2(400, -200) #Coords relative to parent button
		$order_result_message.show()
		await get_tree().create_timer(1.0).timeout  # waits 1 second
		$order_result_message.hide()
