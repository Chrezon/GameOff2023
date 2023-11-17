extends BulletVolley

class_name ParallelVolley

@export_range(0.0, 1.0) var width : float = 1.0
@export var randomize_pos : bool

func shoot(direction: Vector2, root: Node):
	var width_px : float = width * globals.viewport_size.x
	var origin = get_origin()
	var pos_step = width_px / (num_bullets - 1)
	var pos_min = origin.x - (width_px/2)
	var pos_max = origin.x + (width_px/2)

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

