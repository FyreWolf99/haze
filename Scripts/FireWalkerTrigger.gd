extends "res://Scripts/AreaDoorTransition.gd"

var ACCEL = 0;

@onready var player = get_node("../../CharacterBody2D")
@onready var lava_wall = get_node("../../LavaWall")

var is_camera_cunt = false

func _process(delta):
	if is_camera_cunt:
		camera.position.x = player.position.x - 270
		lava_wall.position.x = lerp(lava_wall.position.x, player.position.x, ACCEL * delta)

func on_body_continue():
	var timer = get_tree().create_timer(1.5)
	await timer.timeout
	is_camera_cunt = true


func _on_timer_timeout():
	if is_camera_cunt:
		ACCEL += 0.5
		lava_wall.material.set_shader_parameter("len", ACCEL / 10)
