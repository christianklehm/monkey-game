extends Button

func _on_pressed() -> void:
	if $"..".order_is_correct():
		print("The order is correct.")
	else:
		print("The order is incorrect.")
