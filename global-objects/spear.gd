extends Area2D

var direction=1
var speed = 750

func _physics_process(delta):
	position += transform.x*speed*delta*direction

func _on_body_entered(body):
	if body.is_in_group("takesDamage"):
		body.queue_free()
	if body.name!="Birdley":
		queue_free()
