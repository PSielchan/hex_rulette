extends Node2D

@onready var main: Node = %Main
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var button: Button = $Sprite2D/Button
@onready var button2: Button = $Sprite2D/Button2
@onready var background: Sprite2D = $background
@onready var book: TextureButton = $TextureButton

const num_pages = 3

var prev_page = -1
var page = 0

func _process(_delta) :
	if page != prev_page :
		prev_page = page
		$Sprite2D/AnimationPlayer.play("disappear")
		sprite_2d.texture = load("res://assets/rule_book/pages/page_" + str(page) + ".png")
		$Sprite2D/AnimationPlayer.play("appear")

func toggle() :
	main.paused=!main.paused
	sprite_2d.visible=!sprite_2d.visible
	button.visible=!button.visible
	button2.visible=!button2.visible
	background.visible=!background.visible
	book.visible=!book.visible
	

func _on_texture_button_pressed() -> void:
	toggle()
	sprite_2d.texture = load("res://assets/rule_book/pages/page_" + str(page) + ".png")

func _on_button_pressed() -> void:
	%Main.paused = true
	if page == num_pages : 
		toggle()
		return
	page += 1
	#print("On page -> " + str(page))

func _on_button_2_pressed() -> void:
	if page == 0 :
		return
	page -= 1
	#print("On page -> " + str(page))
	
	
