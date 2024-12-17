extends Node


#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandParent

var caster = null
var target = null
var animationName = ''
# animationFunc вызывается в actionAnimFrame у юнита, передавая свои уник данные
# применяется во время конкретного кадра анимки персонажа
var animationFunc = null
# дистанция взаимдоействия. 0 значит, что походить к цели не надо
var actionDistance = 0

func _init(caster, target, animationName, animationFunc):
	self.caster = caster
	self.target = target
	self.animationName = animationName
	self.animationFunc = animationFunc
	caster.playAnim(animationName)

# код. исполняемый в process юнита, пока он жив, иначе удаляемся
func processCommand():
	if caster && caster.isLive():
		action()
	else:
		endAnimation()

func action():
	pass

func endAnimation():
	caster.removeCommand()
	queue_free()