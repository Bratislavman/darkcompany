extends Node

#команда проигрыша анимки действия к обьекту и само действие в конкретный момент анимки
class_name CommandAnim

var caster = null
var target = null
var animationName = ''
# animationFunc вызывается в actionAnimFrame у юнита, которую вызывает animationplayer юнита на нужном кадре(прим. атаки)
# применяется во время конкретного кадра анимки персонажа
var animationFunc = null
# дистанция взаимдоействия. 0 значит, что походить к цели не надо
var actionDistance = 0

func _init(caster, target, actionDistance, animationName, animationFunc):
	self.caster = caster
	self.actionDistance = actionDistance
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
