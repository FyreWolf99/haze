extends CharacterBody2D

@onready var anim = $PlayerReUse/AnimatedSprite2D
@onready var bullet_scn = preload("res://Scenes/bullet.tscn")

const SPEED = 300.0
const ACCELERATION = 5

var accel = ACCELERATION
var inp = Vector2()

func _process(_delta):
	if Input.is_action_just_pressed("pew"):
		var new_pew = bullet_scn.instantiate()
		new_pew.position = position
		#new_pew.look_at()
		new_pew.look_at(get_viewport().get_mouse_position())
		new_pew.rotation += deg_to_rad(90)
		get_parent().add_child(new_pew)

func _physics_process(delta):
	inp.x = Input.get_axis("lft", "rht")
	inp.y = Input.get_axis("up", "dwn")
	
	if inp.x > 0:
		anim.flip_h = 1
		accel = ACCELERATION
		anim.play("Run")
	elif inp.x < 0:
		anim.flip_h = 0
		accel = ACCELERATION
		anim.play("Run")
	elif inp.y:
		accel = ACCELERATION
		anim.play("Run")
	else:
		accel = ACCELERATION * 2
		anim.play("Idle")
	
	velocity = lerp(velocity, inp * SPEED, accel * delta)
	
	move_and_slide()
