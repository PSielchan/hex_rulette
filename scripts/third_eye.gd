extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_curse_0_pressed() -> void:
	change_queue(0)
	pass # Replace with function body.


func _on_curse_1_pressed() -> void:
	change_queue(1)
	pass # Replace with function body.


func _on_curse_2_pressed() -> void:
	change_queue(2)
	pass # Replace with function body.


func _on_curse_3_pressed() -> void:
	change_queue(3)
	pass # Replace with function body.


func change_queue(idx) :
	$"../Queue/QueueBody".buffer[2] = idx
	$"../Queue/QueueBody".reset_textures()
	pass
