extends CharacterBody2D

const SPEED = 300.0

var movePosition
var targetPosition
var isHero = false

@onready var _animated_sprite = $AnimatedSprite2D

var speed = SPEED

func _physics_process(delta: float) -> void:
	if movePosition || targetPosition:
		var distTargetPosition
		var targetInLeft
		var permissibleDistance = 5
		if targetPosition:
			distTargetPosition = int(abs(position.x - targetPosition.x))
			targetInLeft = targetPosition.x > position.x
			permissibleDistance = rand_range(5, 10)
		else:
			distTargetPosition = int(abs(position.x - movePosition.x))
			targetInLeft = movePosition.x > position.x	
		if (distTargetPosition <= 5):
			_animated_sprite.play("stay")
		else:
			velocity.x = move_toward(velocity.x, speed, SPEED)
			move_and_slide()
			_animated_sprite.play("run")
			if (targetInLeft):
				speed = SPEED
			else:
				speed = SPEED*-1

		if (targetInLeft):
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true

func _ready() -> void:
	_animated_sprite.play("stay")

func initTargetAction() -> void:
	_animated_sprite.play("stay")