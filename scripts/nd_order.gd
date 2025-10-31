extends Node2D

var line_items: Dictionary

func _ready() -> void:
	name = "Active Order"
	
	# Generates a random int between 0 and 2 for each color.
	line_items = {
		"red": randi_range(0,2),
		"green": randi_range(0,2),
		"yellow": randi_range(0,2),
	}
	
func get_text() -> String:
	var order_text = "The order is:\n"
	for item in line_items:
		order_text += item + " x" + str(line_items[item]) + "\n"
	return order_text
