extends Area2D

@onready var placed_peanuts: Array = []
const positions: Array = [ 	Vector2(253,360),
							Vector2(232,380),
							Vector2(267,368),
							Vector2(243,392),
							Vector2(283,375),
							Vector2(266,401),
							Vector2(311,387),
							Vector2(292,409),
						]

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			remove_peanut()

func get_next_position() -> Vector2:
	var num_peanuts = len(placed_peanuts)
	return positions[num_peanuts]

func add_peanut(input_color:String) -> void:
	if len(placed_peanuts) >= len(positions):
		return
	var new_peanut = preload("res://scenes/tiny_peanut.tscn").instantiate()
	add_child(new_peanut)
	new_peanut.init(input_color, #sets the peanut color
					get_next_position(), #sets the peanut position
					"Peanut_%d_%s" % [len(placed_peanuts)+1, input_color]) #gives the peanut a name
	placed_peanuts.append(new_peanut)

func remove_peanut() -> void:
	if len(placed_peanuts) == 0:
		return
	var last_peanut = placed_peanuts.pop_back()
	remove_child(last_peanut)
	last_peanut.queue_free()

func clear_plate() -> void:
	while len(placed_peanuts) > 0:
		remove_peanut()
	return

func get_color_count() -> Dictionary:
	var color_count_dict: Dictionary = {
		"red": 0,
		"green": 0,
		"yellow": 0,
	}
	for peanut in placed_peanuts:
		if peanut.color == "red":
			color_count_dict["red"] += 1
		elif peanut.color == "green":
			color_count_dict["green"] += 1
		elif peanut.color == "yellow":
			color_count_dict["yellow"] += 1
	return color_count_dict
	
	
	
	
	
	
	
	
	
