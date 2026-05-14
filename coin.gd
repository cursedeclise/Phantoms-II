extends Area2D

func _on_body_entered(body):
	# Check if the object entering is the player
	if body.name == "Birdley":
		Globalvars.score+=1
		print(Globalvars.score)
		$AudioStreamPlayer.play()
		hide()
		await get_tree().create_timer(0.5).timeout
		queue_free() #uncoins your coin


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Spear":
		Globalvars.score+=1
		print(Globalvars.score)
		$AudioStreamPlayer2.play()
		hide()
		await get_tree().create_timer(0.5).timeout
		queue_free()
