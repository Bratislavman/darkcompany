extends Node2D

@onready var hero = $Node/Hero

func _ready() -> void:
	pass
	#if hero:
		#G.hero = hero

func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton && event.pressed && hero:
		var commandMove = CommandMove.new(hero)
		add_child(commandMove)
