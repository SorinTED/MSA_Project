extends CharacterBody2D


func damage(attack:Attack):
	health -= attack.attack_damage
	
	if health<=0:
		queue_free()
		
