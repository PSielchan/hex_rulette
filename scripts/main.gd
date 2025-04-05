extends Node

@onready var timer: Timer = $Timer
@onready var timer2: Timer = $Timer2

enum Action {Shot, Other}

var next_action = Action.Shot
var do_action = false
var ready_shot = true

func _ready() :
	print('ready')

var tura = 0

func _process(_delta) :
	if next_action==Action.Shot and do_action:
		do_action=false
		ready_shot=false
		timer.start()
	if Action.Other and do_action:
		do_action=false
		timer2.start()
		
	#print(framenum)
	
	#if Input.is_action_just_pressed("ui.")
	#print("Mouse is at: ", get_viewport().get_mouse_position())



func _input(event) :
	if event is InputEventMouseButton and event.pressed :
		pass
		#print(event.button_index)
		#if event.button_index == BUTTON_LEFT :
			#print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			#print("Right click at: ", event.position)

func next_turn():
	tura+=1
	print(str(tura))
	
func end_tura():
	tura-=1


func _on_timer_timeout() -> void:
	timer.stop()
	next_action=Action.Other
	do_action=true


func _on_timer_2_timeout() -> void:
	timer2.stop()
	next_action=Action.Shot
	do_action=true
