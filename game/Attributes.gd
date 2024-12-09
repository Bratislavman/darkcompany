extends Node2D

class_name Attributes

var nameAttr = ''
var max = 0
var value = 0

func _init(name, max):
	nameAttr = name
	self.max = max
	value = max

func plus(val):
	var currVal = value + val
	if currVal > max:
		value = max
	else:
		value = currVal		

func minus(val):
	var currVal = value - val
	if currVal < 0:
		value = 0
	else:
		value = currVal	
	
