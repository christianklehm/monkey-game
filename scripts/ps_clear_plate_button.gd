extends Button

@onready var normal_icon = preload("res://assets/sprites/BinBasket.png")
@onready var hover_icon = preload("res://assets/sprites/BinBasketHover.png")

func _ready() -> void:
	icon = normal_icon


func _on_pressed() -> void:
	$BinSFX.play()
	get_node("../ps_active_plate_controller").clear_plate()

func _on_mouse_entered() -> void:
	icon = hover_icon

func _on_mouse_exited() -> void:
	icon = normal_icon
