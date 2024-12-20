extends CharacterBody2D
class_name Hero
const SPEED :float = 300.0
var target
var commands :Array = []
var attributes :Dictionary = {}
@export var isHero = false
var attackDistance = 10

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	if commands.size():
		# экшен будет либо в мув когда достигаем цели, либо сразу если дейсвие с анимкой
		if commands[0] is CommandMove: # исправи as на is
			if target && commands[0].actionDistance > 0:
				move()
		else:	
			commands[0].action()
	move_and_slide()
	
func _ready() -> void:
	if _animation_player:
		_animation_player.play("ninja/stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)

func move() -> void:
	var distTargetPosition
	var permissibleDistance = commands[0].actionDistance

	distTargetPosition = target.global_position - global_position
	var direction:Vector2 = distTargetPosition.normalized()
	if direction.x > 0:
		direction.x = 1
	elif direction.x < 0:
		direction.x = -1
				
	# завершяем движение и совершаем экшен команды либо движемся к цели
	if G.checkDistance(self, target, permissibleDistance):
		_animation_player.play("ninja/stay")
		commands[0].action()
		velocity = Vector2.ZERO
	else:
		_animation_player.play("ninja/run")
		velocity.x = (direction.x * SPEED)

	# инвертируем спрайт к цели
	if signf(velocity.x) != 0:
		_sprite.flip_h = velocity.x < 0

func initTargetAction() -> void:
	pass
	# _animation_player.play("stay")

func removeCommand():
	commands.pop_front()


func isLive():
	return attributes['hp'].value > 0
