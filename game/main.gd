extends Node2D

@onready var hero = $Node/Hero

func _ready() -> void:
	print(hero, get_instance_id(), 'hero gew ready 0')

func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		var mousePos = MousePosition.new(hero)
		if mousePos && hero:
			hero.isMousePosition = true
			hero.targetPosition = get_global_mouse_position()
			print(hero.targetPosition, 'hero.targetPosition!!!!')
