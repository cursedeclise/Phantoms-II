extends Area2D

func _on_body_entered(body):
	# Check if the object entering is the player
	if body.name == "Birdley":
		Globalvars.score+=1
		print(Globalvars.score)
		# Add sound effect here if needed
		queue_free() # Safely removes the coin [2]
