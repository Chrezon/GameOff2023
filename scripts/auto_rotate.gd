extends Sprite2D

@export var degrees_per_second : float

@onready var rads_per_second = deg_to_rad(degrees_per_second) 	

func _ready():
	rotate(deg_to_rad(randf_range(0, 360)))

func _process(delta):
	rotate(delta * rads_per_second * globals.time_scale)
