extends Node2D


func _ready() -> void:
	for child in $Background_field.get_children():
		if child is Sprite2D and child.name.begins_with("Star_"):
			twinkle_star(child)


func twinkle_star(star: Sprite2D) -> void:
	var tween := create_tween()
	var start_delay := randf()

	tween.tween_property(star, "modulate:a", 0.3, 0.5).set_trans(Tween.TRANS_SINE).set_delay(start_delay)
	tween.tween_property(star, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE)
	tween.set_loops()  # zapętl
