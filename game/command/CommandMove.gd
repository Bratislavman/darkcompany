extends Node2D
class_name CommandMove

var actionDistance = 5
var caster:Hero
var target

func _init(caster:Hero, target):
	if caster && target:
		self.caster = caster
		self.caster.commands.push_back(self) 
		self.target = target
	else:
		remove()
	
func _ready() -> void:
	if caster && target:
		caster.target = target

func action():
	remove()

func remove():
	if caster:
		caster.removeCommand()
	if target is TargetPosition:
		target.queue_free()
	queue_free()
