extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fuck_shit_up")


func _on_animation_player_animation_finished(_anim_name):
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/glitch_player.tscn")
