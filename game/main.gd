extends Node2D

var hero = null

func _ready() -> void:
	hero = get_node("Node/Hero")
	print(hero, get_instance_id(), 'hero gew ready')

func _process(delta: float) -> void:
	pass

func _input(event):
	# print(event.as_text())
	pass
