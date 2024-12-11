extends CharacterBody2D

const SPEED = 300.0
const MOUSE_POS_DISTANCE = 5

# расстояние до взаимдоействия с целью/позиции мыши чтоб прекратить движение
var actionDistance = 10
var movePosition
var targetPosition

var commands = []

var attributes = {}

var isHero = false

var speed = SPEED

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var currCommand = getCurrCommand()

	if currCommand is CommandMove && movePosition || targetPosition:
		var distTargetPosition
		var targetInLeft
		var permissibleDistance = MOUSE_POS_DISTANCE

		# определяем раст-е до цели(для объекта делаем немножко с рендомом)
		if targetPosition:
			distTargetPosition = int(abs(position.x - targetPosition.x))
			targetInLeft = targetPosition.x > position.x
			permissibleDistance = randi_range(MOUSE_POS_DISTANCE, actionDistance)
		else:
			distTargetPosition = int(abs(position.x - movePosition.x))
			targetInLeft = movePosition.x > position.x	
		
		# завершяем движение либо движемся к цели
		if (distTargetPosition <= permissibleDistance):
			_animated_sprite.play("stay")
		else:
			velocity.x = move_toward(velocity.x, speed, SPEED)
			move_and_slide()
			_animated_sprite.play("run")
			if (targetInLeft):
				speed = SPEED
			else:
				speed = SPEED*-1

		# инвертируем спрайт к цели
		if (targetInLeft):
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true
	
	if currCommand:
		currCommand.action()
		

func _ready() -> void:
	_animated_sprite.play("stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)
	print(attributes)

func initTargetAction() -> void:
	pass
	# _animated_sprite.play("stay")

func getCurrCommand():
	if commands.size() > 0:
		return commands[0]
	else:
		return null	

func removeCommand():
	if commands.size() > 0:
		commands.remove_at(0)

func isLive():
	return attributes['hp'].value > 0
