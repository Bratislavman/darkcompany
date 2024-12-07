extends Node2D


@onready var hero = $Node/Hero

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		print(	hero, 'cvcvССММ1111')
		if hero:
			hero.targetPosition = get_global_mouse_position()