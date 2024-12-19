extends Node2D
class_name CommandMove

var actionDistance = 5
var target:Hero
var mousePos

@onready var mousePosScene = load("res://game/TargetPosition.tscn")

func _init(hero:Hero):
	if hero:
		target = hero
		target.commands.push_back(self) 
	else:
		remove()
	
func _ready() -> void:
	mousePos = mousePosScene.instantiate()
	add_child(mousePos)
	if mousePos && target:
		mousePos.global_position = get_global_mouse_position()
		target.target = mousePos

func action():
	remove()

func remove():
	if target:
		target.removeCommand()
	if mousePos:
		mousePos.queue_free()
	queue_free()
