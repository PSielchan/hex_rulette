extends Node2D

@onready var button: Button = $Button
@onready var main: Node = %Main

const header = "res://assets/player/"

var current_curse = -1

var curse_names = ["agnoia", "chronos", "fatum", "hybris", "fatum", "healthy"]

func _ready() :
	update_textures()
	
func update_textures() :
	var curse_name = curse_names[current_curse]
	for child in get_children() :
		if child.name == "left" :
			var text = header + curse_name + "/" + child.name + ".png"
			child.texture = load(text)

func _process(_delta) :
	if main.ready_shot:
		button.show()
	else:
		button.hide()
	
	
	var character_curses = %Main.h_curses
	for i in range(len(character_curses)-1, -1, -1) :
		if character_curses[i] != -1:
			current_curse = character_curses[i]
			update_textures()
			break
	#current_curse = -1
	#update_textures()



func _on_button_pressed() -> void:
	main.ready_shot=false
	main.who_is_shot=main.Players.Hero
	main.shot=true
