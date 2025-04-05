extends Sprite2D

#@onready var Main: Node = %Main


func rand_curse_id() :
	return int(randf()*4)

var buffer = [rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id(), rand_curse_id()]

var textures = [preload("res://assets/queue/curse_0.png"),
				preload("res://assets/queue/curse_1.png"),
				preload("res://assets/queue/curse_2.png"),
				preload("res://assets/queue/curse_3.png"),
				]

#func _ready() :
	## Change child textures when ready, or call this function elsewhere
	#change_children_images()

func change_children_images() :
	get_node("../AnimationPlayer").play("slide")
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
		print(buffer)
		change_children_images()
			
		#if event.button_index == BUTTON_LEFT :
			#print("Left click at: ", event.position)
		#elif event.button_index == BUTTON_RIGHT :
			#print("Right click at: ", event.position)
