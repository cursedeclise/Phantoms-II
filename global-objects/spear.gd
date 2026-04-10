extends Area2D

var direction=1
var speed = 8
var lifetime=0.4
var cycle=0

func _physics_process(delta):
	if cycle<2:
		rotation += speed*delta*direction
	if cycle==2:
		if direction==1:
			rotation=0
		if direction==-1:
			rotation=3.1415926
	#rotation += speed*delta*direction

func _on_body_entered(body):
	if body.is_in_group("takesDamage"):
		body.queue_free()
		Globalvars.score+=1
	if body.name=="Birdley":
		await get_tree().create_timer(lifetime).timeout
		queue_free()
	else:
		#queue_free()
		pass
