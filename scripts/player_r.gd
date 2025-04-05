extends Node2D

@onready var main: Node = %Main
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rozdzka: Node2D = $"../Rozdzka"


var f = true
var s = false

func _process(_delta) :
	if main.tura == 1 and f:
		f=false
		animated_sprite_2d.animation="grab"
		animated_sprite_2d.scale=Vector2(2.6,2.6)
		timer.start()


func _on_timer_timeout() -> void:
	timer.stop()
	s=true
	animated_sprite_2d.animation="hold"
	animation_player.play("show")
	timer_2.start()



func _on_timer_2_timeout() -> void:
	if s:
		s=false
		animation_player.play("hide")
	else:
		timer_2.stop()
		animated_sprite_2d.animation="default"
		animated_sprite_2d.scale=Vector2(3.4,3.4)
		rozdzka.show()
		main.end_tura()
		f=true
