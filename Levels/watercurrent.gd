extends Area2D
var force=6000

func _on_body_entered(body: Node2D) -> void:
	Globalvars.launch=true
	body.velocity=Vector2(0,-4000)
