extends Area2D

@onready var placed_peanuts: Array = []

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			remove_peanut()

func add_peanut(input_color:String) -> void:
	if len(placed_peanuts) > 0:
		return
	var new_peanut = preload("res://scenes/tiny_peanut.tscn").instantiate()
	add_child(new_peanut)
	placed_peanuts.append(new_peanut)
	new_peanut.init(input_color, Vector2(270,380))

func remove_peanut() -> void:
	if len(placed_peanuts) == 0:
		return
	var last_peanut = placed_peanuts.pop_back()
	remove_child(last_peanut)
	last_peanut.queue_free()
