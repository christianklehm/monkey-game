extends Control

var line_items: Dictionary
@onready var display = $RevealPanel/text_display
@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	name = "Active Order"
	
	# Generates a random int between 0 and 2 for each color.
	line_items = {
		"red": randi_range(0,2),
		"green": randi_range(0,2),
		"yellow": randi_range(0,2),
	}

func display_text() -> void:
	display.text = get_text()
	display.position = Vector2(81, 40)
	display.show()
	print(display.text)
	
func get_text() -> String:
	var order_text = ""
	for item in ["red", "green", "yellow"]:
		order_text += "× " + str(line_items[item]) + "\n"
	return order_text
