extends CharacterBody2D

const SPEED = 300.0
const MOUSE_POS_DISTANCE = 5

# расстояние до взаимдоействия с целью/позиции мыши чтоб прекратить движение
var actionDistance = 10
var targetPosition
var isMousePosition = false

var command = null

var attributes = {}

var isHero = false

var speed = SPEED

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if command && targetPosition || targetPosition:
		var distTargetPosition
		var targetInR
		var permissibleDistance = MOUSE_POS_DISTANCE

		distTargetPosition = int(abs(position.x - targetPosition.x))
		
		targetInR = targetPosition.x > position.x	

		if !isMousePosition:
			permissibleDistance = randi_range(MOUSE_POS_DISTANCE, actionDistance)

		# завершяем движение либо движемся к цели
		if (distTargetPosition <= permissibleDistance):
			_animated_sprite.play("stay")
		else:
			_animated_sprite.play("run")
			if (targetInR):
				speed = SPEED
			else:
				speed = SPEED*-1
			velocity.x = move_toward(velocity.x, speed, SPEED)
			move_and_slide()

		# инвертируем спрайт к цели
		if (targetInR):
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true
	
	if command:
		command.action()
		

	var xxx = get_last_slide_collision() 
	if xxx: 
		print(xxx.get_collider(), 'cv2222')	

func _ready() -> void:
	_animated_sprite.play("stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)
	print(attributes)

func initTargetAction() -> void:
	pass
	# _animated_sprite.play("stay")

func removeCommand():
	command = null

func isLive():
	return attributes['hp'].value > 0