extends Control


@onready var fill_max = $ColorRect.size.x
var fill_amount:float

func update_healthbar(current_health,total_health):
	fill_amount = (float(current_health)/total_health)*fill_max
	$ColorRect.size.x = fill_amount
