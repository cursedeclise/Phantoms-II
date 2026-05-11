extends CharacterBody2D
@onready var animated_sprite=$AnimatedSprite2D
const JUMPVELOCITY=-1200
const GRAVITY=0
var speed=20000
var nowallstick=false
var direction=1

func flip():
	if nowallstick==false:
		direction*=-1
		nowallstick=true



func _physics_process(delta): 
	
	velocity.y=direction*speed*delta

	
	animated_sprite.play("walk")
	
	if is_on_floor() and nowallstick==false:
		direction*=-1
		nowallstick=true
		
	if is_on_ceiling() and nowallstick==false:
		direction*=-1
		nowallstick=true
		
	if !is_on_floor() and !is_on_ceiling():
		nowallstick=false
	if direction !=0:
		animated_sprite.flip_v=direction<0
	move_and_slide()
