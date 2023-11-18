extends Node

@export var extra_spawners : Array[NodePath]

func _ready():
	$GameOverOverlay.hide()
	for s in extra_spawners:
		get_node(s).set_process(false)
		print("disabled " + get_node(s).name)

func _on_player_hit():
	$GameOverOverlay.show()

func increase_difficulty():
	print("here ")
	var s = extra_spawners.pick_random()
	get_node(s).set_process(true)
	extra_spawners.remove_at(extra_spawners.find(s))
	print("enabled " + get_node(s).name)
	
	if extra_spawners.is_empty():
		$Timer.stop()
