extends AnimationPlayer

func _ready():
	globals.change_time_begin.connect(
		func():
			play("fade_audio_in")
	)
	globals.change_time_end.connect(
		func():
			play("fade_audio_out")
	)
