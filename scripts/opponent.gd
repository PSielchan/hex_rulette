extends Node2D

@onready var button: Button = $Button
@onready var main: Node = %Main

const header = "res://assets/player/"

var current_curse = -1

var names = ["fire", "grab", "misfire", "reach", "right"]

var curse_names = ["agnoia", "chronos", "fatum", "hybris", "fatum", "healthy"]

func _on_button_pressed() -> void:
	main.ready_shot=false
	main.who_is_shot=main.Players.Enemy
	main.shot=true

func _ready() :
	update_texture()

func update_texture() :
	var curse_name = curse_names[current_curse]
	for child in get_children() :
		if child.name == "Curse" :
			var text = "res://assets/opponent/opponent_" + curse_name + ".png"
			child.texture = load(text)
			pass
	pass

func _process(_delta) :
	if main.ready_shot:
		button.show()
	else:
		button.hide()
		
		
	var opponent_curses = %Main.e_curses
	for i in range(len(opponent_curses)-1, -1, -1) :
		if opponent_curses[i] != -1 and opponent_curses[i] != current_curse :
			current_curse = opponent_curses[i]
			update_texture()
			return
	current_curse = -1
	update_texture()
	pass
