extends Node

var score=0
var playerhealth=120
var iframes=true


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
