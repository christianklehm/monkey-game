extends Node2D

@onready var active_monkey

func _ready() -> void:
	create_monkey()

func create_monkey() -> void:
	var new_monkey = preload("res://scenes/monkey.tscn").instantiate()
	add_child(new_monkey)
	active_monkey = new_monkey
	active_monkey.display_monkey()
	
# This function checks whether the peanuts on the plate match the active order.		
func order_is_correct() -> bool:
	var plate_color_counts = $"ps_active_plate_controller".get_color_count()
	var check_result = false
	if plate_color_counts == active_monkey.order.line_items:
		check_result = true
	return check_result
