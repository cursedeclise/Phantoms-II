extends Area2D
const DAMAGEVAL=10






#func _on_body_entered(body):
	## Check if the object entering is the player
	#if body.name == "Birdley" and Globalvars.iframes==false:
		#Globalvars.playerhealth-=10
		#Globalvars.iframes=true
		#print("health: "+ str(Globalvars.playerhealth))
		#print("iframes on")
#
#
#func _on_body_exited(body: Node2D) -> void:
	#if body.name == "Birdley":
		#Globalvars.iframes=false
		#print("iframes off")
