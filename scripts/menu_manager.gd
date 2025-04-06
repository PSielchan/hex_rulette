extends Node2D

@onready var menu = $"."
@onready var background = $background
@onready var start = $background/Start
@onready var exit = $background/Exit
@onready var credits = $background/Credits

var elements = [background, start, exit, credits]

var menu_visible = true
var first_try = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event) :
	if event.is_action_pressed("ui_cancel") :
		elements_toggle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func elements_toggle() :
	if menu_visible :
		$AnimationPlayer.play("disable")
		if first_try :
			first_try = false
			$"../Comicbook".play_comic()
			$"../Rule_book".toggle()
	else :
		$AnimationPlayer.play("enable")
	menu_visible = !menu_visible


func _on_start_pressed() -> void:
	elements_toggle()
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	$AnimationPlayer.play("credits_show")
	pass # Replace with function body.


func _on_credits_table_pressed() -> void:
	$AnimationPlayer.play("credits_hide")
	pass # Replace with function body.
