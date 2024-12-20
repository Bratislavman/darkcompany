extends CommandAnim
class_name CommandAttackMelee

var startAttackAnim = false

func _init(caster, target):
	actionDistance = 80
	
	var commandMove = CommandMove.new(caster, target, actionDistance)
	G.add_child(commandMove)
	
	caster.commands.push_back(self) 
	G.add_child(self)
	
	var dmg = func():
		target.dmg()
		
	super._init(caster, target, "unit/attack", dmg)
		
func _process(delta: float) -> void:
	if !startAttackAnim && caster.commands[0].get_instance_id() == get_instance_id() && G.checkDistance(caster, target, actionDistance):
		caster.playAnim(animationName)
		startAttackAnim = true
	
