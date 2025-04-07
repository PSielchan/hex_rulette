extends Node2D

@onready var main: Node = %Main
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ind = int(randf()*3)
	$page_0/display.texture = load("res://assets/comicbook/pic_" + str(ind) + ".png")
	$page_0/text.texture = load("res://assets/comicbook/text_" + str(ind) + ".png")
	pass # Replace with function body.


func play_comic() :
	$AnimationPlayer.play("play")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func stop():
	$page_1/display.hide()
	$page_0/display.hide()
	$page_0/text.hide()
func _on_timer_timeout() -> void:
	timer.stop()
	main.play_comic=false
