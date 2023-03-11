extends Node

var chill_music
var loud_music

# Called when the node enters the scene tree for the first time.
func _ready():
	chill_music = AudioStreamPlayer.new()
	loud_music = AudioStreamPlayer.new()
	
	chill_music.stream = load("res://Assets/Music/Jazz Non-combat.wav")
	chill_music.volume_db = -80
	add_child(chill_music)
	
	loud_music.stream = load("res://Assets/Music/Combat Theme Loop.wav")
	loud_music.volume_db = -80
	add_child(loud_music)
	
	chill_music.play()
	loud_music.play(chill_music.get_playback_position())

func chill():
	var tween = get_tree().create_tween()
	tween.tween_property(chill_music, "volume_db", 0, 2)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(loud_music, "volume_db", -80, 2)

func loud():
	var tween = get_tree().create_tween()
	tween.tween_property(chill_music, "volume_db", -80, 2)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(loud_music, "volume_db", 0, 2)

func shut_up():
	var tween = get_tree().create_tween()
	tween.tween_property(chill_music, "volume_db", -80, 2)
	var tween2 = get_tree().create_tween()
	tween2.tween_property(loud_music, "volume_db", -80, 2)
