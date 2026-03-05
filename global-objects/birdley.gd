extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=2000
const TOPSPEED=2000
const ACC=2500
var speed=0
var iframes=false
var airjumps=2

func _physics_process(delta): 
	var direction=0
	
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
		airjumps=2
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
	
	if abs(velocity.x)<TOPSPEED and not is_on_wall():
		speed+=ACC
	elif abs(velocity.x)<TOPSPEED and is_on_wall():
		speed+=0.5*ACC
	if abs(velocity.x)>=TOPSPEED:
		speed-=(0.2*ACC)
		
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
		
	elif Input.is_action_just_pressed("jump") and airjumps>0:
		animated_sprite.play("wait")
		velocity.y=JUMPVELOCITY
		airjumps-=1
	elif Input.is_action_just_pressed("jump") and is_on_wall():
		animated_sprite.play("wait")
		velocity.y=JUMPVELOCITY
		velocity.x=(2*TOPSPEED)*(direction*-1)*delta
		
	move_and_slide()
