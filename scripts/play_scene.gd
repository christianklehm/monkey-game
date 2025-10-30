extends Node2D

@onready var active_order

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_order = preload("res://scenes/order.tscn").instantiate()
	add_child(new_order)
	active_order = new_order
	for item in active_order.line_items:
		print(item["type"],": ",item["count"])
