extends Node2D

@export var volley : Volley
@export var fire_cooldown = 0.5

var fire_cooldown_remaining = 0

func _process(delta):
	fire_cooldown_remaining -= delta

	if (fire_cooldown_remaining <= 0):
		volley.shoot(self.position, Vector2.DOWN, get_parent())
		fire_cooldown_remaining = fire_cooldown
