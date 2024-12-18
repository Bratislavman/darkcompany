extends CharacterBody2D

const SPEED = 300.0

var target
var commands = []
var attributes = {}
@export var isHero = false
var speed = SPEED
var attackDistance = 10

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	if commands.size():
		# экшен будет либо в мув когда достигаем цели, либо сразу если дейсвие с анимкой
		if commands[0] as CommandMove:
			if target && commands[0].actionDistance > 0:
				move()
		else:	
			commands[0].action()


func _ready() -> void:
	if _animation_player:
		_animation_player.play("ninja/stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)

func move() -> void:
	var distTargetPosition
	var targetInR
	var permissibleDistance = commands[0].actionDistance
	
	print(position.x, '  ', target.position.x, '334')

	distTargetPosition = int(abs(position.x - target.position.x))
	
	targetInR = target.position.x > position.x

	# завершяем движение и совершаем экшен команды либо движемся к цели
	if (distTargetPosition <= permissibleDistance):
		_animation_player.play("ninja/stay")
		commands[0].action()
	else:
		_animation_player.play("ninja/run")
		if (targetInR):
			speed = SPEED
		else:
			speed = SPEED*-1
		velocity.x = move_toward(velocity.x, speed, SPEED)
		move_and_slide()

	# инвертируем спрайт к цели
	if (targetInR):
		_sprite.flip_h = false
	else:
		_sprite.flip_h = true

func initTargetAction() -> void:
	pass
	# _animation_player.play("stay")

func removeCommand():
	commands.pop_front()


func isLive():
	return attributes['hp'].value > 0
