extends Camera2D
@export var Birdley: Node

func _process(delta: float) -> void:
	offset = offset.lerp((Globalvars.playerspeed/150)*Globalvars.direction, delta * 5)
