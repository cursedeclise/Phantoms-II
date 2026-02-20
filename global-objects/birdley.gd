extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const SPEED=600
const JUMPVELOCITY=-400
const GRAVITY=900


func _physics_process(delta): 
	var direction=0
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
	
	if Input.is_action_pressed("walkright"):
		direction=1
		animated_sprite.play("run")
	elif Input.is_action_pressed("walkleft"):
		direction=-1
		animated_sprite.play("run")
	velocity.x=direction*SPEED
	if not Input.is_anything_pressed():
		animated_sprite.play("wait")


	if direction !=0:
		animated_sprite.flip_h=direction<0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite.play("wait")
		velocity.y=JUMPVELOCITY
	move_and_slide()
