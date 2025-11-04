extends Node2D

func _ready() -> void:
	$end_day__summary	.text = "End of Day " + str(Global.current_day)
