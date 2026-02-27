extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=2000
var speed=3000
var direction=1
var bounceblock=false

func _physics_process(delta): 
	
	velocity.x=direction*speed*delta
	
	animated_sprite.play("walk")
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
		
	if is_on_wall() and bounceblock==false:
		direction*=-1
		bounceblock=true
	
	if is_on_floor_only():
		bounceblock=false
	if direction !=0:
		animated_sprite.flip_h=direction<0
	move_and_slide()
