extends Node

var chill_music
var loud_music
var high_pass

const TRANS_SEC = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	chill_music = AudioStreamPlayer.new()
	loud_music = AudioStreamPlayer.new()
	
	high_pass = AudioEffectHighPassFilter.new()
	high_pass.cutoff_hz = 750
	AudioServer.add_bus_effect(0, high_pass)
	
	chill_music.stream = load("res://Assets/Music/Jazz Non-combat.wav")
	chill_music.volume_db = 0
	add_child(chill_music)
	
	loud_music.stream = load("res://Assets/Music/Combat Theme Loop.wav")
	loud_music.volume_db = -80
	add_child(loud_music)
	
	chill_music.play()
	loud_music.play(chill_music.get_playback_position())

func chill():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(chill_music, "volume_db", 0, TRANS_SEC)
	tween.tween_property(loud_music, "volume_db", -80, TRANS_SEC)
	tween.tween_property(high_pass, "cutoff_hz", 20, TRANS_SEC)

func loud():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(chill_music, "volume_db", -80, TRANS_SEC)
	tween.tween_property(loud_music, "volume_db", 0, TRANS_SEC)

func shut_up():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(chill_music, "volume_db", -80, TRANS_SEC)
	tween.tween_property(loud_music, "volume_db", -80, TRANS_SEC)
