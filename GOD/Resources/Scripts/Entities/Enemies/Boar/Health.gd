extends Node2D


@export var TOTAL_HEALTH:=50
var health : int

func _ready():
	health = TOTAL_HEALTH
	
func damage(attack: Attack):
	health -= attack.attack_damage

	if health <=0:
		get_parent().queue_free()
		
