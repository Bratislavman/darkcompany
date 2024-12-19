extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_up():
	var npc = get_parent()
	print(npc.commands, 'char click')
	if npc && !npc.isHero && G.hero:
		
		if npc.commands.size() && (npc.commands[0] as CommandMove):
			npc.commands[0].remove()
		
		# G.hero


func _on_mouse_entered():
	print('2')


func _on_pressed():
	print('111111')
