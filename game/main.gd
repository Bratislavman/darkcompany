extends Node2D

@onready var hero = $Hero
@onready var mousePosScene = load("res://game/TargetPosition.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("click") and hero:
		var mousePos = mousePosScene.instantiate()
		add_child(mousePos)
		mousePos.global_position = get_global_mouse_position()
		
		var commandMove = CommandMove.new(hero, mousePos)
		add_child(commandMove)
