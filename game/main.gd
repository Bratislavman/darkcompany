extends Node2D

@onready var hero = $Hero

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("click") and hero:
		var commandMove = CommandMove.new(hero)
		add_child(commandMove)
