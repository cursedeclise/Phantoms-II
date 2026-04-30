extends Area2D

var time = 0.0
var radius_x = 500
var radius_y = 100
var speed = 1.6

func _process(delta):
	time += delta * speed
	# Calculate X and Y using sine and cosine
	position.x = cos(time) * radius_x
	position.y = sin(time) * radius_y

func _on_body_entered(body: Node2D) -> void:
	if body.name==("Birdley"):
		Globalvars.gravity=2000
		Globalvars.airjumps=8
		Globalvars.inwater=true
		Globalvars.darkness=32


func _on_body_exited(body: Node2D) -> void:
	if body.name==("Birdley"):
		Globalvars.gravity=3500
		Globalvars.airjumps=2
		Globalvars.inwater=false
		Globalvars.darkness=128
