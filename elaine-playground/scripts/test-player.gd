extends Node2D

# TODO: maybe even has params
signal slowTimeBegin
signal slowTimeEnd

# This is basically just emulating an actual
# player class.
func _on_button_pressed():
	slowTimeBegin.emit()
	await get_tree().create_timer(5.0).timeout
	slowTimeEnd.emit()
