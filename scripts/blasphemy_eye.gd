extends Node2D

@onready var main: Node = %Main
@onready var flaga: Sprite2D = $flaga
@onready var znaczek: Sprite2D = $znaczek
@onready var button: Button = $Button

func _process(_delta: float) -> void:
	if main.szare[1]:
		flaga.texture=preload("res://assets/blasfemy/unavaible.png")
		znaczek.texture=preload("res://assets/blasfemy/eye_u.png")
		button.disabled=true
	else:
		flaga.texture=preload("res://assets/blasfemy/avaible.png")
		znaczek.texture=preload("res://assets/blasfemy/eye_a.png")
		button.disabled=false
		


func _on_button_pressed() -> void:
	main.blas_clicked=true
	main.curr_buff=0
