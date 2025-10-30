extends Node2D

var line_items: Array
var item_types: Array = ["red", "green", "yellow"]

func _ready() -> void:
	name = "Active Order" 
	for type in item_types:
		var line_item = {
			"type": type,
			"count": randi_range(0,2),
		}
		line_items.append(line_item)
