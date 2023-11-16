extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed()->void:
	get_tree().change_scene_to_file("res://Resources/Scenes/First.tscn");
	


func _on_button1_pressed()->void:
	get_tree().change_scene_to_file("res://Resources/Scenes/Maps/CityDawn.tscn");


func _on_button2_pressed()->void:
	get_tree().change_scene_to_file("res://Resources/Scenes/Maps/Map.tscn");


func _on_button3_pressed()->void:
	pass


func _on_button4_pressed()->void:
	pass


func _on_button5_pressed()->void:
	pass


func _on_button6_pressed()->void:
	pass
