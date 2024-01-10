extends Control

@onready var level_1 = $"../../"


func _on_resume_pressed():
	level_1.pauseMenu()


func _on_quit_pressed():
	get_tree().quit()
	
