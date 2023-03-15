extends Node2D

const MIN_TIME = 2

@onready var timer = $Timer
@onready var enemy_scn = preload("res://Scenes/enemy.tscn")

func _ready():
	_on_timer_timeout()

func _on_timer_timeout():
	print("SPAWNING")
	if timer.wait_time > 2:
		timer.wait_time -= 1
	var new_enemy = enemy_scn.instantiate()
	
	get_parent().add_child.call_deferred(new_enemy)
