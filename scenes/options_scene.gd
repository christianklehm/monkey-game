extends Node2D


func _ready() -> void:
	# Set without triggering the value_changed callbacks
	$HBoxContainer/SFX_Volume_Slider.set_value_no_signal(AudioManager.get_sfx_linear())
	$HBoxContainer2/Music_Volume_Slider.set_value_no_signal(AudioManager.get_music_linear())


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioManager.set_sfx_volume(value)

func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioManager.set_music_volume(value)
