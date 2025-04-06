extends Node2D

const healthy_vial = "res://assets/health/healthy_vial.png"
const agnoia_vial = "res://assets/health/agnoia_vial.png"
const chronos_vial = "res://assets/health/chronos_vial.png"
const fatum_vial = "res://assets/health/fatum_vial.png"
const hybris_vial = "res://assets/health/hybris_vial.png"
const black_vial = "res://assets/health/black_vial.png"


var textures = [preload(agnoia_vial),
				preload(chronos_vial),
				preload(fatum_vial),
				preload(hybris_vial),
				preload(black_vial),
				preload(healthy_vial),
]

var texts = ["blue","green", "red", "yellow", "black", "healthy"
]

var prev_character = [-1, -1, -1, -1]
var prev_enemy = [-1, -1, -1, -1]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var character_curses = %Main.h_curses
	var enemy_curses = %Main.e_curses
	var all_vials = $vials.get_children()
	
	for vial in all_vials :
		var info = vial.name.split("") # e.g., ["h", "2"] or ["e", "3"]
		var group = info[0]
		var index = int(info[1])
		var new_value
		var prev_value
		
		if group == "h" :
			new_value = character_curses[index]
			prev_value = prev_character[index]
			prev_character[index] = new_value
		elif group == "e" :
			new_value = enemy_curses[index]
			prev_value = prev_enemy[index]
			prev_enemy[index] = new_value
		if new_value != prev_value :
			$AnimationPlayer.play("fill_" + group + str(index))
			print("new_value -> " + str(new_value) + " " + texts[new_value])
			vial.texture = textures[new_value]
			
	pass



#func change_children_images() :
	#$AnimationPlayer.play("slide")
	#var children = get_children()
	#for i in len(buffer) :
		#children[i].texture = textures[buffer[i]]
