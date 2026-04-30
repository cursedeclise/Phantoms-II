extends CanvasModulate

func _process(_delta: float) -> void:
	
	color=Color8(Globalvars.darkness, Globalvars.darkness, Globalvars.darkness, 255)
	if Input.is_action_just_pressed("Secondary"):
		Globalvars.darkness+=1
			
