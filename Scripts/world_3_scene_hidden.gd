extends Area2D

func _on_body_entered(_body):
	BackgroundMusic.loud()
	get_tree().change_scene_to_file("res://Scenes/Worlds/world_4.tscn")
