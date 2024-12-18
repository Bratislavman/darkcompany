extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_up():
	var npc = get_parent()
	print(G.hero.commands, 'char click')
	if npc && !npc.isHero && G.hero:
		
		if G.hero.commands.size() && (G.hero.commands[0] as CommandMove):
			G.hero.commands[0].remove()
		
		# G.hero
