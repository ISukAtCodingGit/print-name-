extends CharacterBody2D

# Movement values
const MAX_SPEED = 200.0
const ACCELERATION = 1000.0
const FRICTION = 800.0
const JUMP_VELOCITY = -400.0
const BASE_GRAVITY = 1200.0
const FALL_MULTIPLIER = 1
const BOOST_VELOCITY = -250.0

var jumped := false
var boosted := false

# Get nodes
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


#movements
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")

	# Apply gravity with fall multiplier
	if not is_on_floor():
		if velocity.y > 0:
			# Falling
			velocity.y += BASE_GRAVITY * FALL_MULTIPLIER * delta
		else:
			velocity.y += BASE_GRAVITY * delta
	else:
		velocity.y = 0  # Reset when grounded
		jumped = false
		boosted = false

	# Handle jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true

	#Boost jump
	if Input.is_action_pressed("boost jump") and not is_on_floor() and boosted == false:
		velocity.y = BOOST_VELOCITY
		boosted == true
	# Handle  movement
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

	# Handle animations
	if direction == 0:
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("move")

	# Handle flipping sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	move_and_slide()
