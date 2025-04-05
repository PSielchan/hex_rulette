extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var main: Node = %Main

var time = 6

const timer1 = "res://assets/timer/Timer1.png"
const timer2 = "res://assets/timer/Timer2.png"
const timer3 = "res://assets/timer/Timer3.png"
const timer4 = "res://assets/timer/Timer4.png"
const timer5 = "res://assets/timer/Timer5.png"
const timer6 = "res://assets/timer/Timer6.png"

var textures = [preload(timer1),
				preload(timer2),
				preload(timer3),
				preload(timer4),
				preload(timer5),
				preload(timer6)
]

func run():
	var time_in_seconds = 1
	while time>0:
		sprite_2d.texture=textures[time-1]
		if !main.paused:
			time-=1
		await get_tree().create_timer(time_in_seconds).timeout
	time=main.timer_4.wait_time
	print(time)
