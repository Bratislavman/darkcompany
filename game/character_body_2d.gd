extends CharacterBody2D

const SPEED = 300.0

var target
var command = null
var attributes = {}
var isHero = false
var speed = SPEED
var attackDistance = 10

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	if command:
		# экшен будет либо в мув когда достигаем цели, либо сразу если дейсвие с анимкой
		if command as CommandMove:
			if target && command.actionDistance > 0:
				move()
		else:	
			command.action()


func _ready() -> void:
	if _animation_player:
		_animation_player.play("ninja/stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)

func move() -> void:
	var distTargetPosition
	var targetInR
	var permissibleDistance = command.actionDistance

	distTargetPosition = int(abs(position.x - target.position.x))
	
	targetInR = target.position.x > position.x

	# завершяем движение и совершаем экшен команды либо движемся к цели
	if (distTargetPosition <= permissibleDistance):
		_animation_player.play("ninja/stay")
		command.action()
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
	command = null

func isLive():
	return attributes['hp'].value > 0
