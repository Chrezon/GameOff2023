extends Volley

class_name ConeVolley

@export_range(0, 360) var arc : float
@export var random_in_arc : bool

func shoot(origin: Vector2, direction: Vector2, root: Node2D):
	if num_bullets == 1:
		_shoot_single(origin, direction, root)
		return
	
	var angle_step = deg_to_rad(arc) / (num_bullets - 1)
	var angle_start = direction.angle() - deg_to_rad(arc) / 2
	var angle_end = direction.angle() + deg_to_rad(arc) / 2
	
	if random_in_arc:
		for i in range(num_bullets):
			_shoot_single(origin,
				Vector2.RIGHT.rotated(randf_range(angle_start, angle_end)),
				root)
	else:
		for i in range(num_bullets):
			_shoot_single(origin,
				Vector2.RIGHT.rotated(angle_start + angle_step * i),
				root)

