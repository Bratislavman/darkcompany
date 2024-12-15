extends Node2D

@onready var hero = $Node/Hero
@onready var starterPos = load("res://game/TargetPosition.tscn")

func _ready() -> void:
	print(starterPos, 'hero gew ready 0')

	if hero && starterPos:
		var sp = starterPos.instantiate()
		add_child(sp)
		sp.position.y = 200
		hero.position = sp.position

func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		# var mousePos = MousePosition.new(hero)
		# if mousePos && hero:
		if hero:
			hero.isMousePosition = true
			hero.targetPosition = get_global_mouse_position()
			print(hero.targetPosition, 'hero.targetPosition!!!!')
