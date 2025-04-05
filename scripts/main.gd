extends Node

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var queue: Node2D = $"../Queue/QueueBody"
@onready var timer_4: Timer = $Timer4
@onready var timer_5: Timer = $Timer5
@onready var rozdzka: Node2D = $"../Rozdzka"

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
		timer_4.stop()
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
		print(e_curses)
		print()
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
			var current_cure=queue.take()
			update_enemy(current_cure)
		print("Atak")
	if who_is_shot == Players.Hero:
		if buffer[current_bullet]:
			var current_cure=queue.take()
			update_me(current_cure)
		print("Przyjmuje na klate")
		blasphemy += 1
		if blasphemy == 3 :
			var time_in_seconds = 5
			await get_tree().create_timer(time_in_seconds).timeout
			blasphemy = 0
			#show_choice
	for i in range(4):
		if h_curses[i]==2:
			var cursed=randf()
			if cursed<0.25:
				h_curses[i]=4
				update_me(4)
	queue.update_queue()
	next_action=Action.Other
	
	

func _on_timer_2_timeout() -> void:
	timer_2.stop()
	if buffer[current_bullet]:
		var current_cure=queue.take()
		update_me(current_cure)
	print("AŁA")
	queue.update_queue()
	for i in range(4):
		if e_curses[i]==2:
			var cursed=randf()
			if cursed<0.25:
				e_curses[i]=4
				update_enemy(4)
	avaible_action=true
	timer_4.start()

func update_me(current_cure):
	for i in range(4):
		if h_curses[i] == HEALTHY:
			h_curses[i] = current_cure
			if current_cure == 1:
				timer_4.wait_time = timer_4.wait_time - 2
			return
	#end game

func update_enemy(current_cure):
	for i in range(4):
		if e_curses[i] == HEALTHY:
			e_curses[i] = current_cure
			return
	#win game



func _on_timer_4_timeout() -> void:
	timer_4.stop()
	print("debug")
	rozdzka.timeup()
	timer_5.start()



func _on_timer_5_timeout() -> void:
	timer_5.stop()
	if buffer[current_bullet]:
		var current_cure=queue.take()
		update_me(current_cure)
	blasphemy += 1
	if blasphemy == 3 :
		var time_in_seconds = 5
		await get_tree().create_timer(time_in_seconds).timeout
		blasphemy = 0
		#show_choice
	for i in range(4):
		if h_curses[i]==2:
			var cursed=randf()
			if cursed<0.25:
				h_curses[i]=4
				update_me(4)
	queue.update_queue()
	next_action=Action.Other
