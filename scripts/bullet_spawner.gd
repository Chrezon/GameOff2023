extends Node2D

@export var volley_chain : VolleyChain

var fire_cooldown_remaining = 0

func _process(delta):	
	fire_cooldown_remaining -= delta * globals.time_scale
		
	if (fire_cooldown_remaining <= 0):
		fire_cooldown_remaining =\
			volley_chain.shoot_next(self.position, Vector2.DOWN, get_parent())
