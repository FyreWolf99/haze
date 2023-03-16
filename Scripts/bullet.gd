extends Sprite2D

const SPEED = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_add = Vector2(0, -SPEED).rotated(rotation)
	position += new_add

func _on_area_2d_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		var timer = get_tree().create_timer(2)
		await timer.timeout
		queue_free()
