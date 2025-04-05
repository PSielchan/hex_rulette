extends Sprite2D

var POSITION = $".".position

func rand_curse_id() :
	return int(randf()*4)

var buffer = [rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id()]

const agnoia_file = "res://assets/queue/agnoia.png"
const chronos_file = "res://assets/queue/chronos.png"
const fatum_file = "res://assets/queue/fatum.png"
const hybris_file = "res://assets/queue/hybris.png"

var textures = [preload(agnoia_file),
				preload(chronos_file),
				preload(fatum_file),
				preload(hybris_file),
				]

#var curses_positions

func _ready() :
	# Change child textures when ready, or call this function elsewhere
	
	change_children_images()


func change_children_images() :
	$AnimationPlayer.play("slide")
	var children = get_children()
	for i in len(buffer) :
		children[i].texture = textures[buffer[i]]

func _input(event) :
	if event is InputEventMouseButton and event.pressed :
		#if Main.last_action == Main.Action.Shot :
		#for i in len(buffer) - 1 :
			#buffer[i] = buffer[i + 1]
		#buffer[len(buffer) - 1] = rand_curse_id()
		if len(buffer) > 0 :
			buffer.remove_at(0)
		buffer.append(rand_curse_id())
		#print(buffer)
		change_children_images()
			
		#if event.button_index == BUTTON_LEFT :
			#print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			#print("Right click at: ", event.position)
