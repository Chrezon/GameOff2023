extends BulletVolley

class_name ParallelVolley

@export_range(0, 1000) var width : float
@export var randomize_pos : bool

func shoot(origin: Vector2, direction: Vector2, root: Node2D):
	var pos_step = width / (num_bullets - 1)
	var pos_min = origin.x - (width/2)
	var pos_max = origin.x + (width/2)

	if randomize_pos:
		for i in range(num_bullets):
			_shoot_single(Vector2(randf_range(pos_min, pos_max), origin.y),
				direction,
				root)
	else:
		for i in range(num_bullets):
			_shoot_single(Vector2(pos_min + pos_step * i, origin.y),
				direction,
				root)

