extends Sprite2D

const SPEED = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_add = Vector2(0, -SPEED).rotated(rotation)
	position += new_add
