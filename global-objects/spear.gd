extends Area2D

var direction=1
var speed = 8

func _physics_process(delta):
	rotation += speed*delta*direction

func _on_body_entered(body):
	if body.is_in_group("takesDamage"):
		body.queue_free()
		Globalvars.score+=1
	if body.name=="Birdley":
		await get_tree().create_timer(0.4).timeout
		queue_free()
	else:
		#queue_free()
		pass
