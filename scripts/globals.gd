extends Node

signal change_time()

var time_scale = 1.0

@export var MIN_TIME_SCALE = 0.1

# TODO gradually slow down time instead of snapping
func _process(delta):	
	if Input.is_action_pressed("change_speed"):
		time_scale = MIN_TIME_SCALE
	else:
		time_scale = 1

	change_time.emit()
