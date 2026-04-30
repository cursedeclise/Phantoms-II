extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name==("Birdley"):
		Globalvars.darkness=96


func _on_body_exited(body: Node2D) -> void:
		if body.name==("Birdley"):
			Globalvars.darkness=160
			
