extends CharacterBody2D

@export var MAX_SPEED_NORMAL = 300.0
@export var MAX_SPEED_SLOW = 200.0
@export var ACCELERATION = 10000.0

signal hit

@onready var sprite_size = $Sprite2D.get_rect().size * $Sprite2D.scale
@onready var current_max_speed = MAX_SPEED_NORMAL

func _ready():
	globals.change_time_begin.connect(func(): current_max_speed = MAX_SPEED_SLOW )
	globals.change_time_end.connect(func(): current_max_speed = MAX_SPEED_NORMAL )
	pass

func _physics_process(delta):
	var targetVel = Vector2.ZERO

	targetVel.x = Input.get_axis("move_left", "move_right")
	targetVel.y = Input.get_axis("move_up", "move_down")
	targetVel = targetVel.normalized() * current_max_speed
	
	velocity = velocity.move_toward(targetVel, ACCELERATION * delta)
	move_and_slide()

	position.x = clamp(position.x, sprite_size.x / 2, globals.viewport_size.x - sprite_size.x / 2)
	position.y = clamp(position.y, sprite_size.y / 2, globals.viewport_size.y - sprite_size.y / 2)

func handle_bullet_collision():
	hit.emit()
	print("player got hit by a bullet")
	hide()

