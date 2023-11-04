extends Volley

class_name ConeVolley

@export_range(0, 360) var arc : float

func shoot(origin: Vector2, direction: Vector2, root: Node2D):
	if num_bullets == 1:
		_shoot_single(origin, direction, root)
		return
	
	var angle_step = deg_to_rad(arc) / (num_bullets - 1)
	var angle_start = direction.angle() - deg_to_rad(arc) / 2
	for i in range(num_bullets):
		_shoot_single(origin,
			Vector2.RIGHT.rotated(angle_start + angle_step * i),
			root)

