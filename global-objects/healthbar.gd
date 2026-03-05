extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value=Globalvars.playerhealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvars.playerhealth!=value:
		value=Globalvars.playerhealth
