extends CommandCast

class_name CommandAttack

func _init(caster, target, dmg):
	var attack = func():
		if (target):
			target.damage(dmg)

	super._init(caster, target, 'attack', attack)

