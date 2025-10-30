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
