extends Button

var game_scene = preload("res://scenes/game.tscn")

func _on_pressed():
	get_tree().change_scene_to_packed(game_scene)
