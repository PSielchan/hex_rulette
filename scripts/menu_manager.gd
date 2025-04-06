extends Node2D

@onready var menu = $"."
@onready var background = $background
@onready var start = $background/Start
@onready var settings = $background/Settings
@onready var exit = $background/Exit
@onready var credits = $background/Credits

var elements = [background, start, settings, exit, credits]

var menu_visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func elements_toggle() :
	if menu_visible :
		$AnimationPlayer.play("disable")
	else :
		$AnimationPlayer.play("enable")
	menu_visible != menu_visible
		

func _on_start_pressed() -> void:
	elements_toggle()
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	pass # Replace with function body.
