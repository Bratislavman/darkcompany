extends Node2D

@onready var hero = $Node/Hero

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton && event.pressed && hero:
		if hero.command as CommandMove:
			hero.command.remove()
		var commandMove = CommandMove.new(hero)
		add_child(commandMove)