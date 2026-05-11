extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=2000
var speed=20000
var nowallstick=false
var direction=1

func flip():
	if nowallstick==false:
		direction*=-1
		nowallstick=true



func _physics_process(delta): 
	
	velocity.x=direction*speed*delta

	
	animated_sprite.play("walk")
	
	if is_on_floor(): #no gravity on floor
		velocity.y=0
	else: #gravity if no floor
		velocity.y+=GRAVITY*delta
		
	if is_on_wall() and nowallstick==false:
		direction*=-1
		nowallstick=true
	if is_on_floor_only():
		nowallstick=false
	if direction !=0:
		animated_sprite.flip_h=direction<0
	move_and_slide()
