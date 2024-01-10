extends Control

@onready var Player = $"../../"

var Arms_PowerUps = 0
var Torso_PowerUps = 0
var Legs_PowerUps = 0

#Statuses
var Attack_value = 20
var Attack_range = 100
var Defense = 0
@export var SPEED = 400.0
@export var JUMP_VELOCITY = -600

@export var attacking = false

func _on_arms_pressed():
	Player.armsUP()
	
func _on_legs_pressed():
	Player.legsUP()

func _on_chest_pressed():
	Player.chestUP()
	
