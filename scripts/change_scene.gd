extends Button

# var game_scene = preload()

func _change_scene_to_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _change_scene_to_main():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
