extends CollisionShape2D

func _physics_process(_delta): 
	if Globalvars.dashing==true:
		disabled=true
	else:
		disabled=false
	
