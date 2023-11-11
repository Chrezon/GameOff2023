extends CharacterBody2D

@export var MAX_SPEED = 300.0
@export var ACCELERATION = 10000.0

signal hit

@onready var sprite_size = $Sprite2D.get_rect().size * $Sprite2D.scale

func _physics_process(delta):
	var targetVel = Vector2.ZERO

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	targetVel.x = Input.get_axis("move_left", "move_right")
	targetVel.y = Input.get_axis("move_up", "move_down")
	targetVel = targetVel.normalized() * MAX_SPEED
	
	velocity = velocity.move_toward(targetVel, ACCELERATION * delta)
	move_and_slide()
	
	position.x = clamp(position.x, sprite_size.x / 2, globals.viewport_size.x - sprite_size.x / 2)
	position.y = clamp(position.y, sprite_size.y / 2, globals.viewport_size.y - sprite_size.y / 2)

func handle_bullet_collision():
	hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
	print("player got hit by a bullet")

