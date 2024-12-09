extends CharacterBody2D

const SPEED = 300.0

var movePosition
var targetPosition

var commands = []
var attributes = {}

var isHero = false

@onready var _animated_sprite = $AnimatedSprite2D

var speed = SPEED

func _physics_process(delta: float) -> void:
	# перемещение к объекту либо в позицию мыши
	if movePosition || targetPosition:
		var distTargetPosition
		var targetInLeft
		var permissibleDistance = 5
		if targetPosition:
			distTargetPosition = int(abs(position.x - targetPosition.x))
			targetInLeft = targetPosition.x > position.x
			permissibleDistance = randi_range(5, 10)
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
	
	# исполнение кода команды
	if commands.size() > 0:
		commands[0].action()


func _ready() -> void:
	_animated_sprite.play("stay")
	attributes['dmg'] = Attributes.new('Сила', 10)
	print(attributes)

func initTargetAction() -> void:
	pass
	# _animated_sprite.play("stay")
