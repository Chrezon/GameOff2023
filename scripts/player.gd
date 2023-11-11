extends CharacterBody2D

@export var MAX_SPEED = 300.0
@export var ACCELERATION = 10000.0

signal hit

signal change_time(scale_delta)


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0 #ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var targetVel: Vector2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	targetVel.x = Input.get_axis("move_left", "move_right")
	targetVel.y = Input.get_axis("move_up", "move_down")
	targetVel = targetVel.normalized() * MAX_SPEED
	
	velocity = velocity.move_toward(targetVel, ACCELERATION * delta)
	move_and_slide()
	
	if Input.is_action_pressed("slow_down"):
		change_time.emit(0.9)
		
	if Input.is_action_pressed("speed_up"):
		change_time.emit(1.1)


func handle_bullet_collision():
	hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
	print("player got hit by a bullet")

