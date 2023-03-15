extends Area2D

var player_in_range: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("interact") && player_in_range:
		get_tree().change_scene_to_file("res://Scenes/Worlds/world_3.tscn")

func _on_body_entered(_body):
	player_in_range = true

func _on_body_exited(_body):
	player_in_range = false
