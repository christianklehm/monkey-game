extends Node2D

@onready var active_monkey
@onready var max_customers_today = 4
@onready var customers_so_far_today = 0

@onready var monkey_img: TextureRect = $ps_monkey_image # Added by Cherry

# list of possible monkeys
const MONKEY_TYPES := [                        # Added by Cherry
	"student",
	"mom",
	"tourist",
]

func _ready() -> void:
	create_monkey()
	

func create_monkey() -> void:
	customers_so_far_today += 1
	$ps_day_info_overlay/customer_number_display.text = "Customer # "+str(customers_so_far_today)
	var new_monkey = preload("res://scenes/monkey.tscn").instantiate() # Add new monkey "scene" to node tree
	add_child(new_monkey)
	active_monkey = new_monkey
	active_monkey.display_monkey() # display_monkey is defined in nd_monkey.gd
	_set_random_monkey_type() # Added by Cherry

func resolve_order() -> void:
	if customers_so_far_today == max_customers_today: # Only after last customer
		$ps_day_info_overlay/customer_number_display.text = "That was the last customer today!"
		remove_child(active_monkey)
		$ps_submit_order_button.hide()        # Added by Cherry
		active_monkey.queue_free()
		active_monkey = null
		
		await get_tree().create_timer(0.8).timeout
		get_tree().change_scene_to_file("res://scenes/end_day_screen.tscn")
		
	else:
		remove_child(active_monkey)
		active_monkey.queue_free()
		active_monkey = null
		create_monkey()
		
# This function checks whether the peanuts on the plate match the active order.
# Called by the submit order button		
func order_is_correct() -> bool:
	var plate_color_counts = $"ps_active_plate_controller".get_color_count()
	var check_result = false
	if plate_color_counts == active_monkey.order.line_items:
		check_result = true
	return check_result

# Picks a random type for the active monkey node from const
func _set_random_monkey_type() -> void:
	active_monkey.set_monkey_type(MONKEY_TYPES.pick_random())
