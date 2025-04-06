extends Node2D

@onready var main: Node = %Main
@onready var button: Button = $Button
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3

func _on_button_pressed() -> void:
	main.next_turn()
	main.avaible_action = false
	main.do_action=true

func timeup():
	main.next_turn()
	main.avaible_action = false
	

func _process(_delta) :
	if main.avaible_action:
		button.show()
	else:
		button.hide()
	if main.tura == 1:
		timer.start()
		main.end_tura()
		

func _on_timer_timeout() -> void:
	timer.stop()
	hide()
	
func opp():
	timer_2.start()


func _on_timer_2_timeout() -> void:
	timer_2.stop()
	hide()
	timer_3.start()


func _on_timer_3_timeout() -> void:
	timer_3.stop()
	show()
