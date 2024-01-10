extends Node2D


@export var spawnpoint = false

var activated = false

func activate():
	if activated == false:
		print("checkpoint reached")
		activated = true
