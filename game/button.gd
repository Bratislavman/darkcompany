extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_up():
	var npc = get_parent() as Hero
	#потом сделать проверку что герой юзает на нпс по которому кликнул герой, пока ток атака
	if npc && !npc.isHero && npc.isLive():
		CommandAttackMelee.new(G.hero, npc)
