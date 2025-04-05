extends Node

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var queue: Node2D = $"../Queue/QueueBody"

enum Action {Shot, Other}
enum Players {Hero,Enemy}

const HEALTHY = -1

var buffer = Array()
var h_curses = [HEALTHY, HEALTHY, HEALTHY, HEALTHY]
var e_curses = [HEALTHY, HEALTHY, HEALTHY, HEALTHY]
var next_action = Action.Shot
var avaible_action = true
var do_action = false
var ready_shot = false
var shot = false
var who_is_shot
var blasphemy = 0

var current_bullet = 0

func _ready() :
	buffer.resize(10)
	rand_bullets()

var tura = 0

func rand_bulet() :
	return int(randf()*10)
	
func rand_bullets():
	var bullet=rand_bulet()
	for i in range(buffer.size()):
		if i==bullet:
			buffer[i]=true
		else:
			# TO CHAGE TO FALSE
			buffer[i] = true
	
func _process(_delta) :
	if do_action:
		do_action=false
		timer_3.start()
	if next_action==Action.Shot and shot:
		shot=false
		print(str(queue.take()))
		timer.start()
	elif next_action==Action.Other:
		next_action=Action.Shot
		timer_2.start()

		
	#print(framenum)
	
	#if Input.is_action_just_pressed("ui.")
	#print("Mouse is at: ", get_viewport().get_mouse_position())



func _input(event) :
	if event is InputEventMouseButton and event.pressed :
		print(h_curses)
		pass
		#print(event.button_index)
		#if event.button_index == BUTTON_LEFT :
			#print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			#print("Right click at: ", event.position)

func next_turn():
	tura+=1
	#print(str(tura))
	
func end_tura():
	tura-=1

func _on_timer_3_timeout() -> void:
	timer_3.stop()
	ready_shot=true
	
func _on_timer_timeout_1() -> void:
	timer.stop()
	if who_is_shot == Players.Enemy:
		if buffer[current_bullet]:
			update_enemy()
		print("Atak")
	if who_is_shot == Players.Hero:
		if buffer[current_bullet]:
			update_me()
		print("Przyjmuje na klate")
		blasphemy += 1
		if blasphemy == 3 :
			var time_in_seconds = 5
			await get_tree().create_timer(time_in_seconds).timeout
			blasphemy = 0
			
			#show_choice
	queue.update_queue()
	next_action=Action.Other
	
	

func _on_timer_2_timeout() -> void:
	timer_2.stop()
	print("AŁA")
	#queue.update_queue()
	avaible_action=true

func update_me():
	var current_cure=queue.take()
	for i in range(4):
		if h_curses[i] == HEALTHY:
			h_curses[i] = current_cure
			return
	#end game

func update_enemy():
	var current_cure=queue.take()
	for i in range(4):
		if e_curses[i] == HEALTHY:
			e_curses[i] = current_cure
			return
	#win game
	pass
