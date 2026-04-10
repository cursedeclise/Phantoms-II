extends Node

var score=0
var playerhealth=120
var iframes=true
var camSpeed=10
var dashing=false
var playerspeed=Vector2(0,0)
var direction=0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
