extends Node2D
class_name CommandMove

var actionDistance = 5
var target
var mousePos

@onready var mousePosScene = load("res://game/TargetPosition.tscn")

func _init(target):
	if target:
		self.target = target
		self.target.commands.push_back(self) 
	else:
		remove()
	
func _ready() -> void:
	mousePos = mousePosScene.instantiate()
	G.add_child(mousePos)
	if mousePos && target:
		mousePos.position = get_global_mouse_position()
		target.target = mousePos

func action():
	remove()

func remove():
	if target:
		target.removeCommand()
	if mousePos:
		mousePos.queue_free()
	queue_free()
