extends Node

# TODO: Difficulty scaling as game progresses

func _ready():
	$GameOverOverlay.hide()

func _on_player_hit():
	$GameOverOverlay.show()
