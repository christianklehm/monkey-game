extends Area2D

@export var default_texture: Texture2D
@export var hover_texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pn_red_pile_sprite.texture = default_texture

func _on_mouse_entered():
	$pn_red_pile_sprite.texture = hover_texture

func _on_mouse_exited():
	$pn_red_pile_sprite.texture = default_texture

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
