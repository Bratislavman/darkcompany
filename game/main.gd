extends Node2D

@onready var hero = $Hero
@onready var heroScene = load("res://game/ninja.tscn")
@onready var mousePosScene = load("res://game/TargetPosition.tscn")

func _ready() -> void:
	var char1 = heroScene.instantiate()
	add_child(char1)
	char1.position.x = 300
	char1.position.y = 1500
	hero = char1
	
	var char2 = heroScene.instantiate()
	char2.position.x = 600
	char2.position.y = 1500
	add_child(char2)

func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("click") and hero:
		var mousePos = mousePosScene.instantiate()
		add_child(mousePos)
		mousePos.global_position = get_global_mouse_position()
		
		CommandMove.new(hero, mousePos)

func checkDistance(caster, target, actionDistance):
	return caster.global_position.x >= target.global_position.x - actionDistance && caster.global_position.x <= target.global_position.x + actionDistance
