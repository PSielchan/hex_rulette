extends Node

var texts = ["blue","green", "red", "yellow", "black", "healthy"
]

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var queue: Node2D = $"../Queue/QueueBody"
@onready var timer_4: Timer = $Timer4
@onready var timer_5: Timer = $Timer5
@onready var rozdzka: Node2D = $"../Rozdzka"
@onready var pizza: Node2D = $"../Pizza"
@onready var b_eye: Node2D = $"../b_eye"
@onready var b_clover: Node2D = $"../b_clover"
@onready var b_flower: Node2D = $"../b_flower"
@onready var timer_6: Timer = $Timer6
@onready var end_screen: Node2D = $"../end_screen"


enum Action {Shot, Other}
enum Players {Hero,Enemy}

const HEALTHY = -1

var stop_all=false

var hp=4
var en_hp=4

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
var paused=false
var szare = [false,false,false]
var wait_blas = false
var blas_clicked = false
var curr_buff=0
var timer_stop=false
var play_comic = false
var extinction = false


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
			buffer[i] = false #True for debug, false for build
	
func _process(_delta) :
	if stop_all:
		return
	if paused:
		timer_4.paused=true
	else:
		timer_4.paused=false
	if extinction :
		return
	if do_action:
		do_action=false
		timer_3.start()
		paused=true
	if next_action==Action.Shot and shot:
		shot=false
		rozdzka.wand_up=false
		timer_4.stop()
		timer_stop=true
		if buffer[current_bullet] :
			$"../Player_R".animate_fire()
		else :
			$"../Player_R".animate_misfire()
		timer.start()
	elif next_action==Action.Other:
		next_action=Action.Shot
		$"../Opponent_hands".animate_grab()
		rozdzka.opp()
		timer_2.start()
	
	if wait_blas:
		if blas_clicked:
			blas_clicked=false
			wait_blas=false
			blasphemy = 0
			b_eye.hide()
			b_flower.hide()
			b_clover.hide()
			
			if curr_buff==1:
				for i in range(4):
					if h_curses[3-i]!=HEALTHY:
						if h_curses[3-i]==1:
							timer_4.wait_time +=2
						h_curses[3-i]=HEALTHY
						if hp<4: #niepotrzebny warunek bo zawsze prawda
							hp+=1
						break
			elif curr_buff==0:
				$"../kola".poka()
				timer_6.start()
				rozdzka.hide()
				return
			elif curr_buff == 2 :
				$"../Extinction/AnimationPlayer".play("show")
				extinction = true
				
			for i in range(4):
				if h_curses[i]==2:
					var cursed=randf()
					if cursed<0.25:
						h_curses[i]=4
						update_me(4)
			queue.update_queue()
			next_action=Action.Other
			

		
	##print(framenum)
	
	#if Input.is_action_just_pressed("ui.")
	##print("Mouse is at: ", get_viewport().get_mouse_position())



func _input(event) :
	if event is InputEventMouseButton and event.pressed :
		if play_comic:
			$"../Comicbook".stop()
		# TO COMMENT LATER
		#$"../Opponent_hands".animate_grab()
		##print(event.button_index)
		#if event.button_index == BUTTON_LEFT :
			##print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			##print("Right click at: ", event.position)

func next_turn():
	tura+=1
	$"../Player_R".animate_grab()
	##print(str(tura))
	
func end_tura():
	tura-=1

func _on_timer_3_timeout() -> void:
	timer_3.stop()
	paused=false
	ready_shot=true
	
func _on_timer_timeout_1() -> void:
	timer.stop()
	rozdzka.show()
	if who_is_shot == Players.Enemy:
		if buffer[current_bullet]:
			var current_cure=queue.take()
			update_enemy(current_cure)
		else:
			current_bullet+=1
		#print("Atak")
	if who_is_shot == Players.Hero:
		var buffer2 = buffer
		if buffer[current_bullet]:
			var current_cure=queue.take()
			update_me(current_cure)
		else:
			for i in range(4):
				if h_curses[i]==3:
					var rates=10-current_bullet
					if(randf()*rates<1):
						var current_cure=queue.take()
						update_me(current_cure)
						break
			current_bullet+=1
		#print("Przyjmuje na klate")
		if not stop_all:
			blasphemy += 1
			if blasphemy == 3 :
				max_blasphemy()
				return
	
	if not stop_all:
		for i in range(4):
			if h_curses[i]==2:
				var cursed=randf()
				if cursed<0.25:
					h_curses[i]=4
					update_me(4)
		queue.update_queue()
		next_action=Action.Other
	
	
func max_blasphemy():
	var ilosc_szarych=0
	for i in range(4):
		if h_curses[i]==0:
			ilosc_szarych+=1
	if ilosc_szarych<3:
		szare = [false,false,false]
		while ilosc_szarych>0:
			var rand_sz=randf()
			if rand_sz<0.3:
				if szare[0]:
					continue
				else:
					szare[0]=true
					ilosc_szarych-=1
			elif rand_sz<0.6:
				if szare[1]:
					continue
				else:
					szare[1]=true
					ilosc_szarych-=1
			else:
				if szare[2]:
					continue
				else:
					szare[2]=true
					ilosc_szarych-=1
		#for i in range(3):
			#print(szare[i])
		b_eye.show()
		b_flower.show()
		b_clover.show()
		wait_blas=true
	else:
		szare = [true,true,true]
		b_eye.show()
		b_flower.show()
		b_clover.show()
		await get_tree().create_timer(3).timeout
		blasphemy = 0
		b_eye.hide()
		b_flower.hide()
		b_clover.hide()
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
		#print("AŁA")
	else:
		current_bullet+=1
		#print("Not even close babe")
	if not stop_all:
		for i in range(4):
			if e_curses[i]==2:
				var cursed=randf()
				if cursed<0.25:
					e_curses[i]=4
					update_enemy(4)
		queue.update_queue()
		avaible_action=true
		timer_4.start()
		timer_stop=false
		pizza.run()
	

func end_game(winner) :
	stop_all=true
	end_screen.show_panel(winner)
	await get_tree().create_timer(3).timeout
	$"../Menu".elements_toggle()
	end_screen.hide_panel()
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()

func update_me(current_cure):
	hp-=1
	if hp==0:
		print("Przegrałeś")
		end_game(false)
		return
	rand_bullets()
	current_bullet=0
	for i in range(4):
		if h_curses[i] == HEALTHY:
			h_curses[i] = current_cure
			if current_cure == 1:
				timer_4.wait_time -=2
			return
	

func update_enemy(current_cure):
	en_hp-=1
	if en_hp==0:
		print("Wygrałeś")
		end_game(true)
		return
	rand_bullets()
	current_bullet=0
	for i in range(4):
		if e_curses[i] == HEALTHY:
			e_curses[i] = current_cure
			return
	
	



func _on_timer_4_timeout() -> void:
	timer_4.stop()
	rozdzka.timeup()
	await get_tree().create_timer(1).timeout
	timer_4.stop()
	timer_stop=true
	if buffer[current_bullet] :
		$"../Player_R".animate_fire()
	else :
		$"../Player_R".animate_misfire()
	who_is_shot=Players.Hero
	rozdzka.wand_up=false
	timer.start()



func _on_timer_5_timeout() -> void:
	timer_5.stop()
	if buffer[current_bullet]:
		var current_cure=queue.take()
		update_me(current_cure)
	blasphemy += 1
	if blasphemy == 3 :
		max_blasphemy()
		return
			#var time_in_seconds = 5
			#await get_tree().create_timer(time_in_seconds).timeout
			#blasphemy = 0
			#b_eye.hide()
			#b_flower.hide()
			#b_clover.hide()
	for i in range(4):
		if h_curses[i]==2:
			var cursed=randf()
			if cursed<0.25:
				h_curses[i]=4
				update_me(4)
	queue.update_queue()
	next_action=Action.Other


func _on_timer_6_timeout() -> void:
	$"../kola".hide()
	rozdzka.show()
	timer_6.stop()
	for i in range(4):
		if h_curses[i]==2:
			var cursed=randf()
			if cursed<0.25:
				h_curses[i]=4
				update_me(4)
	queue.update_queue()
	next_action=Action.Other
