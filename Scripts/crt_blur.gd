extends CanvasLayer

@onready var anim = $AnimationPlayer
@export var reset: bool = false
@export var no_bitches: bool = false

func _ready():
	if reset:
		anim.play("RESET")
	elif no_bitches:
		anim.play("bitchless")
	else:
		anim.play("fade_in")
