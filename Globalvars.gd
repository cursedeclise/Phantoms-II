extends Node

var score=0
var gravity=3500
var airjumps=2
var playerhealth=120
var iframes=true
var inwater=false
var camSpeed=10
var dashing=false
var playerspeed=Vector2(0,0)
var direction=0
var level=1
var darkness=0
var timed=false
var launch=false
var stage1time= 0.0
var stage2time= 0.0
var stage3time= 0.0
var stage3boss= 0.0
var stage4time= 0.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
