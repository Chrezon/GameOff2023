extends Line2D

@export var scroll_speed = 1000

@onready var max_y = globals.viewport_size.y + 100
@onready var g_curve = Curve2D.new()

func _process(delta):
	print(g_curve.get_point_count())
	
	for i in range(g_curve.get_point_count() - 1, -1, -1):
		var g_point = g_curve.get_point_position(i)
		g_point.y += scroll_speed * delta * globals.time_scale
		
		if g_point.y > max_y:
			g_curve.remove_point(i)
		else:
			g_curve.set_point_position(i, g_point)
		
	g_curve.add_point(global_position)

	clear_points()
	
	for i in g_curve.get_point_count():
		add_point(to_local(g_curve.get_point_position(i)))

