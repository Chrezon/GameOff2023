extends Node

signal change_time_begin()
signal change_time_end()

var time_scale = 1.0

@onready var viewport_size = Vector2(
	ProjectSettings.get_setting("display/window/size/viewport_width"),
	ProjectSettings.get_setting("display/window/size/viewport_height"))
@onready var master_audio_bus_index = AudioServer.get_bus_index("Master")
@export var MIN_TIME_SCALE = 0.1

# TODO gradually slow down time instead of snapping
func _process(delta):
	# var change_speed = 	Input.is_action_pressed("change_speed")
	# time_scale = MIN_TIME_SCALE if change_speed else 1
	if (Input.is_action_just_pressed("change_speed")):
		time_scale = MIN_TIME_SCALE
		change_time_begin.emit()
	if (Input.is_action_just_released("change_speed")):
		time_scale = 1
		change_time_end.emit()

	for i in AudioServer.get_bus_effect_count(master_audio_bus_index):
		AudioServer.set_bus_effect_enabled(master_audio_bus_index, i, time_scale == MIN_TIME_SCALE)

