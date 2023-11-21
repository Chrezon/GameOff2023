extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	volume_db = -80
	globals.change_time_begin.connect(
		func():
			$Anim.play("fade_audio_in")
	)
	globals.change_time_end.connect(
		func():
			$Anim.play("fade_audio_out")
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
