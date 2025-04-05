extends Node2D

func _process(_delta) :
	pass

func animate_grab() :
	#play($AnimationPlayer)
	$AnimationPlayer.play("grab")


func animate_fire() :
	#play($AnimationPlayer)
	$AnimationPlayer.play("fire")
