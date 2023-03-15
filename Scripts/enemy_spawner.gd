extends Node2D

const MIN_TIME = 2

@onready var nigger = rand_from_seed(position.x * position.y)[0] / 2000000000.0
@onready var timer = $Timer
@onready var enemy_scn = preload("res://Scenes/enemy.tscn")

func _ready():
	timer.wait_time += nigger
	_on_timer_timeout()

func _on_timer_timeout():
	if timer.wait_time > 2:
		timer.wait_time -= 1
	timer.start()
	var new_enemy = enemy_scn.instantiate()
	new_enemy.position = position
	
	get_parent().add_child.call_deferred(new_enemy)
