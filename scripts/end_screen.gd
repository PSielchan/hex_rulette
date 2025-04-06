extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_panel(winner = false) :
	if winner :
		$Sprite2D.apply_scale(Vector2(1.5,1.5))
		$Sprite2D.texture = load("res://assets/endscreen/won.png")
	else :
		$Sprite2D.apply_scale(Vector2(1,1))
		$Sprite2D.texture = load("res://assets/endscreen/lost.png")
	$AnimationPlayer.play("show")
	

func hide_panel() :
	$AnimationPlayer.play("hide")
