extends Area2D

@export_node_path var button_affects
@onready var enabler = get_node(button_affects)
var player_in_range: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("interact") && player_in_range:
		enabler.enable()
		$AnimatedSprite2D.frame = 1


func _on_body_entered(_body):
	player_in_range = true

func _on_body_exited(_body):
	player_in_range = false
