extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var button: Button = $Button
@onready var button2: Button = $Button2

func _on_texture_button_pressed() -> void:
	sprite_2d.visible=!sprite_2d.visible
	button.visible=!button.visible
	button2.visible=!button2.visible

func _on_button_pressed() -> void:
	print("+1")


func _on_button_2_pressed() -> void:
	print("-1")
