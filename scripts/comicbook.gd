extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ind = int(randf()*3)
	$page_0/display.texture = load("res://assets/comicbook/pic_" + str(ind) + ".png")
	$page_0/text.texture = load("res://assets/comicbook/text_" + str(ind) + ".png")
	pass # Replace with function body.


func play_comic() :
	$AnimationPlayer.play("play")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
