extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggle() :
	$Sprite2D.visible = !$Sprite2D
	$Sprite2D/curse_0.visibile = !$Sprite2D/curse_0.visibile
	$Sprite2D/curse_1.visibile = !$Sprite2D/curse_1.visibile
	$Sprite2D/curse_2.visibile = !$Sprite2D/curse_2.visibile
	$Sprite2D/curse_3.visibile = !$Sprite2D/curse_3.visibile

func _on_curse_0_pressed() -> void:
	
	pass # Replace with function body.


func _on_curse_1_pressed() -> void:
	pass # Replace with function body.


func _on_curse_2_pressed() -> void:
	pass # Replace with function body.


func _on_curse_3_pressed() -> void:
	pass # Replace with function body.
