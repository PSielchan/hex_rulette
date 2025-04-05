extends Node2D

@onready var main: Node = %Main
@onready var texture_button: TextureButton = $TextureButton
@onready var timer: Timer = $Timer

func _on_texture_button_pressed() -> void:
	main.next_turn()
	$TextureButton.disabled = true

func _process(_delta) :
	if main.tura == 0:
		$TextureButton.disabled = false
		timer.start()
		

func _on_timer_timeout() -> void:
	timer.stop()
	hide()
