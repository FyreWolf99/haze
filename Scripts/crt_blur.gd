extends CanvasLayer

@onready var anim = $AnimationPlayer
@export var reset: bool = false

func _ready():
	if reset:
		anim.play("RESET")
	else:
		anim.play("fade_in")
