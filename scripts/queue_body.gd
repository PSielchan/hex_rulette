extends Sprite2D

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

func _ready() :
	# Change child textures when ready, or call this function elsewhere
	buffer = [rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id()]
	change_children_images()
	
	
func update_queue():
	if len(buffer) > 0 :
		buffer.remove_at(0)
	buffer.append(rand_curse_id())
	change_children_images()

func take():
	return buffer[1]
	
func reset_textures() :
	var children = get_children()
	for i in len(buffer) :
		children[i].texture = textures[buffer[i]]
	

func change_children_images() :
	$AnimationPlayer.play("slide")
	reset_textures()
		
func get_queue() :
	return buffer
	
func set_queue(new_queue) :
	buffer = new_queue
