extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const ACCELERATION = 5

@onready
var sprite = $PlayerReUse/AnimatedSprite2D

var accel: int

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if (Input.is_action_just_pressed("jmp") || Input.is_action_just_pressed("up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("lft", "rht")
	if (!direction):
		accel = ACCELERATION * 2
	else:
		accel = ACCELERATION
	velocity.x = lerp(velocity.x, direction * SPEED, delta * accel)
	
	if (direction < -0.05):
		sprite.flip_h = 0
		sprite.play("Run")
	elif (direction > 0.05):
		sprite.flip_h = 1
		sprite.play("Run")
	else:
		sprite.stop()
	
	if !is_on_floor():
		sprite.stop()

	move_and_slide()
