extends Sprite2D

func enable():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(1350, 414), 2)
