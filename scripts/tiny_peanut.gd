extends Node2D

# Create editor variables
@export var color: String
@export var red_texture: Texture2D
@export var green_texture: Texture2D
@export var yellow_texture: Texture2D

# Connect child sprite node after initializaiton
@onready var sprite: Sprite2D = $tiny_peanut_sprite

# Custom initilization funtion to allow for input parameters
# Must be called manually
# Params: color is first	 , position vector is second
func init(input_color: String, input_position: Vector2, input_name: String) -> void:
	name = input_name
	color = input_color
	sprite.position = input_position
	if color == "red":
		sprite.texture = red_texture
	if color == "green":
		sprite.texture = green_texture
	if color == "yellow":
		sprite.texture = yellow_texture
