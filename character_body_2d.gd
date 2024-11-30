extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var speed = SPEED

func _physics_process(delta: float) -> void:
	velocity.x = move_toward(velocity.x, speed, SPEED)
	move_and_slide()

	if (get_global_mouse_position().x > position.x):
		speed = SPEED
	else:
		speed = SPEED*-1