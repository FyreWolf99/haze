extends Sprite2D

const SPEED = 20

var can_die = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_tree().create_timer(0.1)
	await timer.timeout
	can_die = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_add = Vector2(0, -SPEED).rotated(rotation)
	position += new_add

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		queue_free()
	if can_die:
		queue_free()
