extends Label

var time_elapsed := 0.0
# You don't really need this
var counter = 1
var is_stopped := false

func _process(delta: float) -> void:
	if !is_stopped:
		time_elapsed += delta
		text = str(time_elapsed).pad_decimals(2) + " s"
	if Globalvars.timed==false:
		stop()

func reset() -> void:
	if Globalvars.level==1:
		Globalvars.stage1time=time_elapsed
	if Globalvars.level==2:
		Globalvars.stage2time=time_elapsed
	if Globalvars.level==3:
		Globalvars.stage3time=time_elapsed
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
