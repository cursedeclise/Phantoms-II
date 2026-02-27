extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=2000
var speed=1000
var direction=1

func _physics_process(delta): 
	
	#velocity.x=direction*speed*delta
	velocity.x=1000
	
	animated_sprite.play("walk")
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
		
	#if is_on_wall():
		#direction*=-1
		
	
	#if direction !=0:
		#animated_sprite.flip_h=direction<0
