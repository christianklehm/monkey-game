extends Node2D

var order
var monkey_type: String
var monkey_texture: Texture2D

@export var texture_student: Texture2D
@export var texture_mom: Texture2D
@export var texture_tourist: Texture2D

func _ready() -> void:
	var new_order = preload("res://scenes/order.tscn").instantiate()
	add_child(new_order)
	order = new_order

func display_order() -> void:
	$monkey_order_display.text = order.get_text()
	$monkey_order_display.show()
	$monkey_order_display.position = Vector2(268, 126)

func display_monkey() -> void:
	display_order() #Currently, only calls display order
					#but more features added here later.
	
func set_monkey_type(input_type: String) -> void:
	monkey_type = input_type
	
	# Uncomment below once textures are added
	#if monkey_type == "student":
		#monkey_texture = texture_student
	#if monkey_type == "mom":
		#monkey_texture = texture_mom
	#if monkey_type == "tourist":
		#monkey_texture = texture_tourist
