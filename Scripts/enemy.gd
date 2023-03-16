extends CharacterBody2D

const SPD = 50

@onready var sprite = $Sprite2D
@onready var player = get_node("../CharacterBody2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var dir = (player.position - position).normalized()
	velocity = dir * SPD
	move_and_slide()
	if velocity.x > 0:
		sprite.flip_h = 1
	elif velocity.x < 0:
		sprite.flip_h = 0
	
	if position.x > 540 - 18:
		position.x = 540 - 18
	elif position.x < 18:
		position.x = 18
	
	if position.y > 414 - 18:
		position.y = 414-18
	elif position.y < 18:
		position.y = 18

func hit():
	queue_free()
