extends Area2D

@export var new_camera_position: Vector2
@export var change_to_chill: bool
@export var change_to_mad: bool
@export var change_to_tense: bool
@export var glitch: bool

@onready var camera = get_node("../../Camera2D")
@onready var left_side_wall = get_node("../../StaticBody2D")

func on_body_continue():
	queue_free()

func _on_body_entered(_body):
	
	if change_to_chill:
		BackgroundMusic.chill()
	elif change_to_mad:
		BackgroundMusic.loud()
	elif change_to_tense:
		BackgroundMusic.tense()
	
	if glitch:
		BackgroundMusic.glitch()
	
	camera.position = new_camera_position
	var tween = create_tween()
	tween.tween_property(left_side_wall, "position", new_camera_position, 0.5)
	on_body_continue()
