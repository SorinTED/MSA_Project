extends CharacterBody2D
class_name Player
@onready var PowerUp = $PowerUp
#Health Bar
var Total_HP = 100
var Current_HP = 0
var Imunity_Frame = true

#Progression bar
var Total_Progress = 500
var Current_Progress = 0
var Progress_Index = 1

#Upgrades
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
@export var upgrade_paused = false



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var Direction = "Left"

func armsUP():
	Attack_range +=20
	Attack_value +=5
	Arms_PowerUps +=1

func legsUP():
	SPEED +=40
	JUMP_VELOCITY -=60
	Legs_PowerUps +=1
	
func chestUP():
	Defense +=1
	Torso_PowerUps +=1

func _ready():
	$AnimationPlayer.play("stas")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 1000:
			velocity.y = 1000
			
	# Handle Jump.
	if Input.is_action_just_pressed("jump") :
		velocity.y = JUMP_VELOCITY
	# Handle Direction of player
	var direction = Input.get_axis("move_left", "move_right")
	
	if Input.is_action_just_pressed("move_left"):
		$Sprite2D.scale.x = abs($Sprite2D.scale.x)
		$Attack_Range.scale.x = abs($Attack_Range.scale.x)

	if Input.is_action_just_pressed("move_right"):
		$Sprite2D.scale.x = abs($Sprite2D.scale.x) * -1
		$Attack_Range.scale.x = abs($Attack_Range.scale.x) * -1
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("attack") :
		attack()
	if Input.is_action_just_pressed("powerup"):
		powerUp()

func attack():
	print("en garde")
	attacking = true
	#insert attack animation
	var overlapping_objects = $Attack_Range.get_overlapping_areas()
	$AnimationPlayer.play("Hit")
	for area in overlapping_objects:
		if area.get_parent().is_in_group("Enemy"):
			var parent = area.get_parent()
			#parent.take_damage()
			parent.queue_free()
	
func take_damage(damage:int):
	pass
	
func can_take_damage():
	pass

func die():
	pass

func powerUp():
	if upgrade_paused:
		PowerUp.hide()
		Engine.time_scale = 1
	else:
		PowerUp.show()
		Engine.time_scale = 0
		
	Total_HP += 10
	Current_HP += 10

	upgrade_paused = !upgrade_paused

