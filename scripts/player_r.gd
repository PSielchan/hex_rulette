extends Node2D

const header = "res://assets/player/"

var current_curse = -1

var names = ["fire", "grab", "misfire", "reach", "right"]

var curse_names = ["agnoia", "chronos", "fatum", "hybris", "fatum", "healthy"]

func _ready() :
	update_textures()

func update_textures() :
	var curse_name = curse_names[current_curse]
	for child in get_children() :
		if child.name in names :
			var text = header + curse_name + "/" + child.name + ".png"
			child.texture = load(text)
	pass

func _process(_delta) :
	var character_curses = %Main.h_curses
	for i in range(len(character_curses)-1, -1, -1) :
		if character_curses[i] != -1 and character_curses[i] != current_curse :
			current_curse = character_curses[i]
			update_textures()
			return
	
	#current_curse = -1
	#update_textures()
	pass

func animate_grab() :
	$AnimationPlayer.play("grab")

func animate_fire() :
	$AnimationPlayer.play("fire")
	
func animate_misfire() :
	$AnimationPlayer.play("misfire")
