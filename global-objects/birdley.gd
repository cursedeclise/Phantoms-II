extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=1800
const TOPSPEED=1200
const ACC=2000
var speed=0

func _physics_process(delta): 
	var direction=0
	
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
	
	if abs(velocity.x)<TOPSPEED:
		speed+=ACC
	
	if Input.is_action_pressed("walkright"):
		direction=1
		animated_sprite.play("run")
	elif Input.is_action_pressed("walkleft"):
		direction=-1
		animated_sprite.play("run")
	
	velocity.x=speed*direction*delta
	if not Input.is_anything_pressed():
		animated_sprite.play("wait")
		speed=0


	if direction !=0:
		animated_sprite.flip_h=direction<0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite.play("wait")
		velocity.y=JUMPVELOCITY
	elif Input.is_action_just_pressed("jump") and is_on_wall():
		animated_sprite.play("wait")
		velocity.y=JUMPVELOCITY
		velocity.x=(2*speed)*(direction*-1)*delta
		
	move_and_slide()
