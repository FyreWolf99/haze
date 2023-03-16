extends Area2D

func _on_body_entered(_body):
	BackgroundMusic.shut_up()
	get_tree().change_scene_to_file("res://Scenes/endless_cutscene.tscn")
