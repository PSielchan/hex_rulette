extends Node2D
@onready var main: Node = %Main
@onready var sprite_2d: Sprite2D = $Sprite2D

const Magiczna_kula_1 = "res://assets/glassball/Magiczna_Kula_1.png"
const Magiczna_kula_2 = "res://assets/glassball/Magiczna_Kula_2.png"
const Magiczna_kula_3 = "res://assets/glassball/Magiczna_Kula_3.png"
const Magiczna_kula_4 = "res://assets/glassball/Magiczna_Kula_4.png"
const Magiczna_kula_5 = "res://assets/glassball/Magiczna_Kula_5.png"
const Magiczna_kula_6 = "res://assets/glassball/Magiczna_Kula_6.png"
const Magiczna_kula_7 = "res://assets/glassball/Magiczna_Kula_7.png"
const Magiczna_kula_8 = "res://assets/glassball/Magiczna_Kula_8.png"
const Magiczna_kula_9 = "res://assets/glassball/Magiczna_Kula_9.png"
const Magiczna_kula_10 = "res://assets/glassball/Magiczna_Kula_10.png"



var textures = [preload(Magiczna_kula_1),
				preload(Magiczna_kula_2),
				preload(Magiczna_kula_3),
				preload(Magiczna_kula_4),
				preload(Magiczna_kula_5),
				preload(Magiczna_kula_6),
				preload(Magiczna_kula_7),
				preload(Magiczna_kula_8),
				preload(Magiczna_kula_9),
				preload(Magiczna_kula_10)
]

func poka():
	sprite_2d.texture=load("res://assets/glassball/Magiczna_Kula.png")
	show()
	$AnimationPlayer.play("show")
	await get_tree().create_timer(2).timeout
	sprite_2d.texture=textures[main.current_bullet]
	
	
	
