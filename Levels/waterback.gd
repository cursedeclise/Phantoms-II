extends NinePatchRect
var time = 0.0
var radius_x = 200
var radius_y = 100
var speed = -2.0

func _process(delta):
	time += delta * speed
	# Calculate X and Y using sine and cosine
	position.x = cos(time) * radius_x
	position.y = sin(time) * radius_y
