extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func wait(sec):
	# don't use!!! just copy it
	await get_tree().create_timer(sec).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("dealsDamage") and Globalvars.iframes==false:
		if area.name==("robot"):
			Globalvars.playerhealth-=5
		Globalvars.playerhealth-=5
		Globalvars.score-=1
		Globalvars.iframes=true
		print("health: "+ str(Globalvars.playerhealth))
		print("iframes on")
		await get_tree().create_timer(1).timeout
		Globalvars.iframes=false
		print("iframes off")
		
	if Globalvars.playerhealth==0:
		get_tree().change_scene_to_file("res://Levels/Death.tscn")
		pass
