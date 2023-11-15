extends Node2D

var selected_character = 0;

var character_container;
var character_name;
var character_description;
var character_image;


# Called when the node enters the scene tree for the first time.
func _ready():
	character_container = get_node("UI/CharacterPannel");
	character_name = get_node("UI/CharacterPannel/CharacterContainer/CharacterTextMargin/CharacterText/CharacterName");
	character_description = get_node("UI/CharacterPannel/CharacterContainer/CharacterTextMargin/CharacterText/CharacterDescription");
	character_image = get_node("UI/CharacterPannel/CharacterContainer/CharacterImage");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(selected_character != 0):
		if(selected_character == 1):
			character_name.set_text(GameVariables.redName);
			character_description.set_text(GameVariables.redDescription);
			character_image.set_texture(GameVariables.redImage)
		elif(selected_character == 2):
			character_name.set_text(GameVariables.yellowName);
			character_description.set_text(GameVariables.yellowDescription);
			character_image.set_texture(GameVariables.yellowImage)
		character_container.visible = true;
	else:
		character_container.visible = false;


func _on_button_pressed()->void:
	get_tree().change_scene_to_file("res://Scenes/First.tscn");


func _on_button_2_pressed()->void:
	if(selected_character != 0):
		GameVariables.selected_character = selected_character;
	get_tree().change_scene_to_file("res://Scenes/First.tscn");


func _on_button_3_pressed()->void:
	selected_character = 1;


func _on_button_4_pressed()->void:
	selected_character = 2;
