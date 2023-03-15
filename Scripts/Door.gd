extends Sprite2D

@export var new_pos: Vector2

func enable():
	var tween = create_tween()
	tween.tween_property(self, "position", new_pos, 1)
