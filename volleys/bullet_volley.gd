extends Volley

class_name BulletVolley

@export_range(1, 100) var num_bullets : int = 1
@export_range(0, 1) var left_right : float = 0.5
@export_range(-180, 180) var _angle_offset : float = 0
@export var bullet_scene : PackedScene = preload("res://scenes/laser_bullet.tscn")

func shoot(direction: Vector2, root: Node2D):
	pass
	
func get_origin() -> Vector2:
	return Vector2(left_right * globals.viewport_size.x, - 100)
	
func _shoot_single(spawn_position: Vector2, direction: Vector2, root: Node2D):
	var b = bullet_scene.instantiate()
	b.rotation = direction.angle() + deg_to_rad(_angle_offset) 
	b.position = spawn_position
	root.add_child(b)
