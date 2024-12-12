extends Node2D

class_name MousePosition

var unit = null

func _init(unit):
	self.unit = unit

	
func _on_input_event(event):
	print(event, 'event _on_input_event')