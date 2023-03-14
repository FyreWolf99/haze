extends Node2D

func _on_audio_stream_player_finished():
	get_tree().change_scene_to_file("res://Scenes/Worlds/world_2.tscn")
