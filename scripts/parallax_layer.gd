extends ParallaxLayer

@export var auto_scroll_speed: Vector2

func _process(delta):
	motion_offset -= auto_scroll_speed * delta
