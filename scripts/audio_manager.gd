extends Node

# Godot's built in audio 'buses' can be found at the bottom of the screen under 'Audio'

var musicPlayer: AudioStreamPlayer
var sfx_bus: int
var music_bus: int

func _ready():
	sfx_bus   = AudioServer.get_bus_index("SFX") # sets sfx_bus to take value of Godot's audio manager SFX bus
	music_bus = AudioServer.get_bus_index("Music") # sets music_bus to take value of Godot's audio manager Music bus
	# Create and add an AudioStreamPlayer to the singleton
	musicPlayer = AudioStreamPlayer.new()
	musicPlayer.bus = "Music"          # make sure it routes to the Music bus
	musicPlayer.connect("finished", Callable(self, "_on_music_finished")) # Makes it so the AudioStream node can signal finished
	add_child(musicPlayer)
	play_music(preload("res://assets/sounds/monkey-song-longer.mp3"))
	
	
func play_music(stream: AudioStream):
	musicPlayer.stream = stream
	musicPlayer.play()

func _on_music_finished():                                               # Should trigger the song to repeat when it finishes
	play_music(preload("res://assets/sounds/monkey-song-longer.mp3"))

func set_sfx_volume(linear: float) -> void: # translates bus decibels to be changed later in settings
	# linear expected in [0.0, 1.0]
	var db := -80.0 if linear <= 0.001 else linear_to_db(linear)
	AudioServer.set_bus_volume_db(sfx_bus, db)

func set_music_volume(linear: float) -> void: # same as above, but for music volume
	# linear expected in [0.0, 1.0]
	var db := -80.0 if linear <= 0.001 else linear_to_db(linear)
	AudioServer.set_bus_volume_db(music_bus, db)
	
func get_sfx_linear() -> float:
	var db := AudioServer.get_bus_volume_db(sfx_bus)
	return 0.0 if db <= -79.9 else db_to_linear(db)

func get_music_linear() -> float:
	var db := AudioServer.get_bus_volume_db(music_bus)
	return 0.0 if db <= -79.9 else db_to_linear(db)
