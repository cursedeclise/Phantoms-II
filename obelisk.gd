extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Birdley" and Globalvars.dashing==true:
		get_tree().paused=true
		Globalvars.timed=false
		Globalvars.level+=1
		$AudioStreamPlayer.play()
		await get_tree().create_timer(1.75).timeout
		get_tree().paused=false
		if get_tree().current_scene.name == "Level one":
			get_tree().change_scene_to_file("res://Levels/lvl2.tscn")
		elif get_tree().current_scene.name == "Node2D":
			get_tree().change_scene_to_file("res://Levels/Citadel.tscn")
		elif get_tree().current_scene.name == "Testingground":
			get_tree().change_scene_to_file("res://Levels/Victory.tscn")
		elif get_tree().current_scene.name == "Tutorial":
			get_tree().change_scene_to_file("res://Levels/level_one.tscn")
