extends Node2D

var hero = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hero = get_node("Hero")
	print(hero, 'vbvb')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	print(event.as_text())