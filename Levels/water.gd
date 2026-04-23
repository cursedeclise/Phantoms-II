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



#func _process(delta: float) -> void:
	#position.x+=60*delta
	#if !up:
		#position.y+=50*delta
		#await get_tree().create_timer(2).timeout
		#up=true
	#else:
		#position.y-=50*delta
		#await get_tree().create_timer(2).timeout
		#up=false
