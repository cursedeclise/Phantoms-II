extends Area2D

func _onready():
	$AudioStreamPlayer2.stream_paused=true


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Birdley":
		$AudioStreamPlayer2.stream_paused=false
