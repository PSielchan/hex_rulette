extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_texture_button_pressed() -> void:
	sprite_2d.visible=!sprite_2d.visible
