extends Node2D

var line_items: Dictionary
#var item_colors: Array = ["red", "green", "yellow"]

func _ready() -> void:
	name = "Active Order"
	line_items = {
		"red": randi_range(0,2),
		"green": randi_range(0,2),
		"yellow": randi_range(0,2),
	} 
	#for color in item_colors:
		#var line_item = {
			#"color": color,
			#"count": randi_range(0,2),
		#}
		#line_items.append(line_item)
