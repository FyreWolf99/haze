extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")

func _on_area_2d_body_entered(_body):
	BackgroundMusic.shut_up()
	get_tree().change_scene_to_file("res://Scenes/death.tscn")
