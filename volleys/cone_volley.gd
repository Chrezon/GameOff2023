extends BulletVolley

class_name ConeVolley

@export_range(0, 360) var arc : float
@export var randomize_dir : bool

func shoot(direction: Vector2, root: Node2D):
	var origin = get_origin()
	var angle_step = deg_to_rad(arc) / (num_bullets - 1)
	var angle_min = direction.angle() - deg_to_rad(arc) / 2
	var angle_max = direction.angle() + deg_to_rad(arc) / 2
	
	if randomize_dir:
		for i in range(num_bullets):
			_shoot_single(origin,
				Vector2.RIGHT.rotated(randf_range(angle_min, angle_max)),
				root)
	elif num_bullets == 1:
			_shoot_single(origin, direction, root)
	else:
		for i in range(num_bullets):
			_shoot_single(origin,
				Vector2.RIGHT.rotated(angle_min + angle_step * i),
				root)

