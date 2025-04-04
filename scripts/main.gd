extends Node

func _ready() :
	print('ready')

var framenum = 0

var buffer = [0, 0, 0, 0]

func _process(delta) :
	framenum += 1
	#print(framenum)
	
	#if Input.is_action_just_pressed("ui.")
	#print("Mouse is at: ", get_viewport().get_mouse_position())



func _input(event) :
	if event is InputEventMouseButton and event.pressed :
		print(event.button_index)
		#if event.button_index == BUTTON_LEFT :
			#print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			#print("Right click at: ", event.position)
