extends Node2D

@onready var button: Button = $Button
@onready var main: Node = %Main

func _on_button_pressed() -> void:
	main.ready_shot=false
	main.who_is_shot=main.Players.Enemy
	main.shot=true

func _process(_delta) :
	if main.ready_shot:
		button.show()
	else:
		button.hide()
