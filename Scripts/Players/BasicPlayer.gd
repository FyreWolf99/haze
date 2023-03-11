extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const ACCELERATION = 5

var accel

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jmp") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("lft", "rht")
	if (!direction):
		accel = ACCELERATION * 2
	else:
		accel = ACCELERATION
	velocity.x = lerp(velocity.x, direction * SPEED, delta * ACCELERATION)

	move_and_slide()
