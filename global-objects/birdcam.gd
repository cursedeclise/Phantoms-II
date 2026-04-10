extends Camera2D
@export var Birdley: Node

func _process(delta: float) -> void:
	offset = offset.lerp((Globalvars.playerspeed/180)*Globalvars.direction, delta * 1.5)
