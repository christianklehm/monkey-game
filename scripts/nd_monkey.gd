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

func display_monkey() -> void:
	$ps_monkey_image.position = Vector2(586, 300)
	order.display_text() #Currently, only calls display order
					#but more features added here later.
					
func hide_monkey() -> void:
	$monkey_order_display.hide()
	
func set_monkey_type(input_type: String) -> void:
	monkey_type = input_type
	
	if monkey_type == "student":
		monkey_texture = texture_student
	if monkey_type == "mom":
		monkey_texture = texture_mom
	if monkey_type == "tourist":
		monkey_texture = texture_tourist
	$ps_monkey_image.texture = monkey_texture
