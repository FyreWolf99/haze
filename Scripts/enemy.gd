extends CharacterBody2D

const SPD = 50

@onready var sprite = $Sprite2D
@onready var player = get_node("../CharacterBody2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	look_at(player.position)
	var dir = Vector2(1, 1).rotated(rotation)
	rotation = 0
	velocity = dir * SPD
	move_and_slide()

func hit():
	queue_free()
