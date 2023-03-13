extends Control

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Worlds/world_2.tscn")
