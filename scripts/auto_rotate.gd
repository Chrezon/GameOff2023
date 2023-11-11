extends Sprite2D

@export var degrees_per_second : float

@onready var rads_per_second = deg_to_rad(degrees_per_second) 	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta * rads_per_second * globals.time_scale)
