extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $AnimatedSprite2D

var speed = SPEED

func _physics_process(delta: float) -> void:
	velocity.x = move_toward(velocity.x, speed, SPEED)
	move_and_slide()
	
	if (int(abs(get_global_mouse_position().x - position.x)) <= 10):
		_animated_sprite.play("default")
	else:
		if (get_global_mouse_position().x > position.x):
			speed = SPEED
			_animated_sprite.flip_h = false
			_animated_sprite.play("run")
		else:
			speed = SPEED*-1
			_animated_sprite.flip_h = true
			_animated_sprite.play("run")


func _ready() -> void:
	_animated_sprite.play("stay")
