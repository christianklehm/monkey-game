extends Node2D

@onready var active_order

func _ready() -> void:
	var new_order = preload("res://scenes/order.tscn").instantiate()
	add_child(new_order)
	active_order = new_order
	for item in active_order.line_items:
		print(item,": ",active_order.line_items[item])
		
func order_is_correct() -> bool:
	var plate_color_counts = $"ps_active_plate_controller".get_color_count()
	var check_result = false
	if plate_color_counts == active_order.line_items:
		check_result = true
	return check_result
