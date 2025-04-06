extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var button: Button = $Sprite2D/Button
@onready var button2: Button = $Sprite2D/Button2
const num_pages = 3

var prev_page = 0
var page = 0

func _process(_delta) :
	if page != prev_page :
		prev_page = page
		sprite_2d.texture = load("res://assets/rule_book/pages/page_" + str(page) + ".png")
		

func _on_texture_button_pressed() -> void:
	sprite_2d.visible=!sprite_2d.visible
	button.visible=!button.visible
	button2.visible=!button2.visible
	sprite_2d.texture = load("res://assets/rule_book/pages/page_" + str(page) + ".png")

func _on_button_pressed() -> void:
	if page == num_pages : 
		return
	page += 1
	print("On page -> " + str(page))

func _on_button_2_pressed() -> void:
	if page == 0 :
		sprite_2d.visible=!sprite_2d.visible
		button.visible=!button.visible
		button2.visible=!button2.visible
		return
	page -= 1
	print("On page -> " + str(page))
	
	
