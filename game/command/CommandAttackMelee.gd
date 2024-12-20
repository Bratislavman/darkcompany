extends CommandAnim
class_name CommandAttackMelee

func _init(caster, target):
	var commandMove = CommandMove.new(caster)
	G.add_child(commandMove)
	super._init(caster, target, 10, 'attack', animationFunc)

func action():
	pass
