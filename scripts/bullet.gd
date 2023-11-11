extends Area2D

@export var speed : float

func _physics_process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * speed * delta * globals.time_scale)
	pass

func _on_timer_timeout():
	queue_free()
	
func _on_body_entered(body):
	if (body.is_in_group("Player")):
		body.handle_bullet_collision()
