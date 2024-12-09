extends Node2D

var hero = null

func _ready() -> void:
	hero = get_node("Hero")
	print(hero, 'hero gew ready')

func _process(delta: float) -> void:
	pass

func _input(event):
	# print(event.as_text())
	pass