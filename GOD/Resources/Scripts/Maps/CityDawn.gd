extends Node2D


@onready var level_1 = $"."
@onready var pause_menu = $CityDawnMap/PauseMenu

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_button_pressed()->void:
	get_tree().change_scene_to_file("res://Resources/Scenes/UI/Menu/World.tscn");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
