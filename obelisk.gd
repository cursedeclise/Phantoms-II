extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Birdley" and Globalvars.dashing==true:
		get_tree().paused=true
		Globalvars.timed=false
		Globalvars.level+=1
		await get_tree().create_timer(3).timeout
		get_tree().paused=false
		get_tree().change_scene_to_file("res://Levels/Death.tscn")
