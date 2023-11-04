extends Area2D

@export var speed : float

func _physics_process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * speed * delta)
	pass

func _on_timer_timeout():
	queue_free()
