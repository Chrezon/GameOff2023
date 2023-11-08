extends Volley

class_name BulletVolley

@export_range(1, 100) var num_bullets : int
@export var bullet_scene : PackedScene = preload("res://scenes/laser_bullet.tscn")

func shoot(origin: Vector2, direction: Vector2, root: Node2D):
	pass
	
func _shoot_single(origin: Vector2, direction: Vector2, root: Node2D):
	var b = bullet_scene.instantiate()
	b.rotation = direction.angle()
	b.position = origin
	root.add_child(b)
