extends Area2D


func _on_body_entered(body):
	if body.is_in_group("takesDamage"):
		body.queue_free()
		Globalvars.score+=1
	if body.name=="Birdley":
		pass
	else:
		#queue_free()
		pass
