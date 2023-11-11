extends Node2D

@export var volley_chain : VolleyChain

@onready var player_scene = $"../Player"

var fire_cooldown_remaining = 0

func _process(delta):	
	fire_cooldown_remaining -= delta * globals.time_scale
	
	if (fire_cooldown_remaining <= 0):
		fire_cooldown_remaining =\
			volley_chain.shoot_next(self.position, player_scene.position, get_parent())
