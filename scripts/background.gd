extends Node2D
#
#func _ready() :
	#var player : AnimationPlayer = $AnimationPlayer
	#var base_animation : Animation = player.get_animation("twinkle")
	#var anim_length : float = base_animation.length
#
	#for star in $Background_field.get_children():
		#if not star.name.begins_with("Star_"):
			#continue
#
		#var offset = randf() * anim_length
		#var cloned_anim := clone_animation_for_node(base_animation, star, offset)
		#var anim_name := "twinkle_" + star.name
		#player.add_animation(anim_name, cloned_anim)
		#player.play(anim_name)
#
#
#func clone_animation_for_node(original_anim : Animation, node : Node, offset : float) -> Animation:
	#var new_anim := Animation.new()
	#new_anim.length = original_anim.length
	#new_anim.loop_mode = original_anim.loop_mode
#
	#for i in original_anim.get_track_count():
		#var track_type := original_anim.track_get_type(i)
		#var original_path := original_anim.track_get_path(i)
#
		## Replace original node name with the actual star's name
		#var new_path := node.get_path()
		#var new_track_idx := new_anim.add_track(track_type)
		#new_anim.track_set_path(new_track_idx, new_path)
#
		#for k in original_anim.track_get_key_count(i):
			#var time := original_anim.track_get_key_time(i, k)
			#var value : Variant = original_anim.track_get_key_value(i, k)
			#var shifted_time := fmod(time + offset, original_anim.length)
			#new_anim.track_insert_key(new_track_idx, shifted_time, value)
#
	#return new_anim
