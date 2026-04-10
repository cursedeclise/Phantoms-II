extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
@export var Spear : PackedScene


const JUMPVELOCITY=-1200
const GRAVITY=2000
const TOPSPEED=2000
const ACC=3500
var atkCooldown=0.33
var speed=0
var dashspeed=6000
var airjumps=2
var direction=0
var lastfacing=1
var attackready=true



func _physics_process(delta): 
	Globalvars.direction=0
	
	
	if is_on_floor() : #no gravity on floor
		velocity.y=0
		airjumps=2
	elif Globalvars.dashing==false: #gravity if no floor
		velocity.y+=GRAVITY*delta
	else:
		velocity.y=0
	
	if abs(velocity.x)<TOPSPEED and not is_on_wall():
		Globalvars.playerspeed.x+=ACC
	elif abs(velocity.x)<TOPSPEED and is_on_wall():
		Globalvars.playerspeed.x+=0.01*ACC
	if abs(velocity.x)>=TOPSPEED:
		Globalvars.playerspeed.x-=(0.2*ACC)
		
	if Input.is_action_pressed("walkright") and Globalvars.dashing==false:
		Globalvars.direction=1
		lastfacing=1

		animated_sprite.play("run")
	elif Input.is_action_pressed("walkleft") and Globalvars.dashing==false:
		Globalvars.direction=-1
		lastfacing=-1
	
		
		animated_sprite.play("run")
	
	velocity.x=Globalvars.playerspeed.x*Globalvars.direction*delta
	if not Input.is_anything_pressed():
		animated_sprite.play("wait")
		Globalvars.playerspeed.x=0


	if Globalvars.direction !=0:
		animated_sprite.flip_h=Globalvars.direction<0
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
		velocity.x=(2*TOPSPEED)*(Globalvars.direction*-1)*delta
		
	if Globalvars.playerhealth<=0:
		get_tree().paused=true
		print("You died :(")
	if Input.is_action_just_pressed("Primary"):
		shoot()
		
	if Input.is_action_pressed("Utility"):
		velocity.x=dashspeed*lastfacing
		animated_sprite.play("dash")
		Globalvars.dashing=true
		Globalvars.iframes=true
		attackready=false
		
	if Input.is_action_just_released("Utility"):
		@warning_ignore("integer_division")
		velocity.x=(dashspeed/2)*delta
		airjumps=2
		Globalvars.dashing=false
		Globalvars.iframes=false
		attackready=true
		
		
	
	move_and_slide()
	
func shoot():
	if attackready==true:
		attackready=false
		var b = Spear.instantiate()
		add_child(b)
		b.direction= lastfacing
		b.transform = $Marker2D.transform
		await get_tree().create_timer(atkCooldown).timeout
		attackready=true
