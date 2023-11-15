extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_selected_character_texture(GameVariables.selected_character);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/World.tscn");
	


func _on_button_2_pressed()->void:
	get_tree().change_scene_to_file("res://Scenes/Character_Selection.tscn")


func _on_button_3_pressed()->void:
	get_tree().quit();


func _set_selected_character_texture(selected_character):
	var displayedCharacter = get_node("UI/SelectedCharacterWrapper/Amo-04");
	if(selected_character == 1):
		displayedCharacter.set_texture(GameVariables.redImage);
	elif(selected_character == 2):
		displayedCharacter.set_texture(GameVariables.yellowImage);
