extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusic.loud()
	var timer = get_tree().create_timer(600)
	await timer.timeout
	get_tree().change_scene_to_file("res://Scenes/jumpscare.tscn")
