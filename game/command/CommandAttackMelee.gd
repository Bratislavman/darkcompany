extends CommandAnim
class_name CommandAttackMelee

var actionDistance = 0

func _init(caster, target, animationName, animationFunc):
	if target:
		self.target = target
		self.target.command = self 
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
