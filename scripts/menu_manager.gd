extends Node2D

@onready var menu = $"."
@onready var background = $background
@onready var start = $background/Start
@onready var exit = $background/Exit
@onready var credits = $background/Credits
@onready var main: Node = %Main
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var elements = [background, start, exit, credits]

var menu_visible = true
var first_try = true

var menu_pause = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event) :
	if event.is_action_pressed("ui_cancel") :
		elements_toggle()
		if !main.paused:
			main.paused=true
			menu_pause=true
		elif menu_pause:
			main.paused=false
			menu_pause=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func elements_toggle() :
	if menu_visible :
		$AnimationPlayer.play("disable")
		if first_try :
			first_try = false
			main.play_comic = true
			$"../Comicbook".play_comic()
			$"../Rule_book".toggle()
	else :
		$AnimationPlayer.play("enable")
	menu_visible = !menu_visible


func _on_start_pressed() -> void:
	audio.play()
	elements_toggle()
	if not first_try:
		if menu_pause:
			main.paused=false
			menu_pause=false
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	audio.play()
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	audio.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	audio.play()
	$AnimationPlayer.play("credits_show")
	pass # Replace with function body.


func _on_credits_table_pressed() -> void:
	$AnimationPlayer.play("credits_hide")
	pass # Replace with function body.
