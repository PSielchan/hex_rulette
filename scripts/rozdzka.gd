extends Node2D

@onready var main: Node = %Main
@onready var button: Button = $Button
@onready var timer: Timer = $Timer

func _on_button_pressed() -> void:
	main.next_turn()
	main.avaible_action = false
	main.do_action=true

func _process(_delta) :
	if main.avaible_action:
		button.show()
	else:
		button.hide()
	if main.tura == 0:
		timer.start()
		

func _on_timer_timeout() -> void:
	timer.stop()
	hide()
