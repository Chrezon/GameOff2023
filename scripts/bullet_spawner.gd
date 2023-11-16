extends Node2D

@export var volley_chains : Array[VolleyChain]

var fire_cooldown_remaining = 0

@onready var player_scene = $"../Player"
@onready var current_chain = volley_chains.pick_random()

func _process(delta):	
	fire_cooldown_remaining -= delta * globals.time_scale
	
	if (fire_cooldown_remaining <= 0):
		var result = current_chain.shoot_next(player_scene.position, get_parent())
		fire_cooldown_remaining = result[0]
		
		if result[1]:
			current_chain = volley_chains.pick_random()
			
