extends Node2D

@onready var hero = $Hero
@onready var heroScene = load("res://game/ninja.tscn")
@onready var mousePosScene = load("res://game/TargetPosition.tscn")
@onready var dialogScene = load("res://game/Dialog.tscn")

var timer = 0
var dialog
var dialogText
var dialogTextEnd = false
var char1

func _ready() -> void:
	char1 = heroScene.instantiate()
	add_child(char1)
	char1.position.x = 300
	char1.position.y = 1500
	hero = char1
	
	var char2 = heroScene.instantiate()
	char2.position.x = 600
	char2.position.y = 1500
	add_child(char2)
	
	dialog = dialogScene.instantiate()
	dialog.position = char1.position
	#dialog.position.x -= char1.get_node('Sprite2D').width / 2
	dialogText = dialog.get_node('MarginContainer/Label')
	dialog.position.x = char1.position.x - dialog.size.x / 2
	dialog.position.y = char1.position.y - dialog.size.y - 15
	add_child(dialog)

func _process(delta: float) -> void:
	var timerMax = 100
	if timer < timerMax:
		timer+=1
	print(timer, 'timer')	
	if timer == timerMax && !dialogTextEnd:
		print('text change')
		dialogText.text = 'vbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbbvbbb'
		dialog.position.x = char1.position.x - dialog.size.x / 2
		dialog.position.y = char1.position.y - dialog.size.y - 15
		dialogTextEnd = true
	
func _unhandled_input(event):
	if Input.is_action_just_pressed("click") and hero:
		var mousePos = mousePosScene.instantiate()
		add_child(mousePos)
		mousePos.global_position = get_global_mouse_position()
		
		CommandMove.new(hero, mousePos)

func checkDistance(caster, target, actionDistance):
	return caster.global_position.x >= target.global_position.x - actionDistance && caster.global_position.x <= target.global_position.x + actionDistance
