extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var prev_blasph = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var blasph = %Main.blasphemy
	if blasph != prev_blasph :
		$AnimationPlayer.play("fill_" + str(prev_blasph))
		prev_blasph = blasph
	pass
