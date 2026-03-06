extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Dart" and Globalvars.iframes==false:
		Globalvars.playerhealth-=5
		Globalvars.iframes=true
		print("health: "+ str(Globalvars.playerhealth))
		print("iframes on")
		Globalvars.wait(1)
		Globalvars.iframes=false
		print("iframes off")
	if area.name == "deathzone" and Globalvars.iframes==false:
		Globalvars.playerhealth-=5
		Globalvars.iframes=true
		print("health: "+ str(Globalvars.playerhealth))
		print("iframes on")
		await get_tree().create_timer(0.5).timeout
		Globalvars.iframes=false
		print("iframes off")
