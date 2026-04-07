#extends Camera2D
#var target_offset=2
#var lerp_speed=5
#func _process(delta: float) -> void:
	#offset = offset.lerp(target_offset, delta * lerp_speed)
