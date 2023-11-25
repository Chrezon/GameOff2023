extends Node

@export var hard_spawner : Node
@export var extra_spawners : Array[NodePath]
@export var game_over_overlay : Node
@export var time_label : Label

@onready var elapsed_scaled_time : float = 0 # in seconds

func _ready():
	game_over_overlay.hide()
	hard_spawner.set_process(false)
	for s in extra_spawners:
		get_node(s).set_process(false)
		print("disabled " + get_node(s).name)
		
func _process(delta):
	elapsed_scaled_time += delta * globals.time_scale

func _on_player_hit():
	var minutes := elapsed_scaled_time / 60
	var seconds := fmod(elapsed_scaled_time, 60)
	var milliseconds := fmod(elapsed_scaled_time, 1) * 100
	time_label.text = "Final Time\n %02dm %02d.%02ds" % [minutes, seconds, milliseconds]
	game_over_overlay.show()

func increase_difficulty():
	if not hard_spawner.is_processing():
		hard_spawner.set_process(true)
		print("enabled hard spawner")
		return

	var s = extra_spawners.pick_random()
	get_node(s).set_process(true)
	extra_spawners.remove_at(extra_spawners.find(s))
	print("enabled " + get_node(s).name)
	
	if extra_spawners.is_empty():
		$DifficultyIncreaseTimer.stop()
