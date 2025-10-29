extends Area2D

@export var default_texture: Texture2D
@export var hover_texture: Texture2D

#var contents_dict = {
	#"peanut 1": {
		#"color": null
		#position: [50, 80]
	#}
#}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pn_green_pile_sprite.texture = default_texture

func _on_mouse_entered():
	$pn_green_pile_sprite.texture = hover_texture

func _on_mouse_exited():
	$pn_green_pile_sprite.texture = default_texture

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("clicked green")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
