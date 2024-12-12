extends Node


#команда проигрыша анимки действия к обьекту и действие в конкретный момент анимки
class_name CommandParent

var caster = null
var target = null
var animationName = ''
# animationFunc вызывается в actionAnimFrame у юнита, передавая свои уник данные
# применяется во время конкретного кадра анимки персонажа
var animationFunc = null

func _init(caster, target, animationName, animationFunc):
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	caster.playAnim(animationName)

# код. исполняемый в process юнита, пока он жив, иначе удаляемся
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