extends Node

class_name CommandParent

var caster = null

# для сложных команд с несколькими фазами
var phase = 0

# код. исполняемый в process юнита
func action():
	if caster:
		if caster.isLive():
			actionEffect()
		else:
			caster.removeCommand()

# что делает команда во время исполнения
func actionEffect():
	pass

func endAnimation():
	caster.removeCommand()	