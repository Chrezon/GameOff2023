extends CharacterBody2D

@export var SPEED = 300.0

signal hit

signal change_time(scale_delta)


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0 #ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y = -SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_dir = Input.get_axis("move_left", "move_right")
	if horizontal_dir:
		velocity.x = horizontal_dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vertical_dir = Input.get_axis("move_up", "move_down")
	if vertical_dir:
		velocity.y = vertical_dir * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_pressed("slow_down"):
		change_time.emit(0.9)
		
	if Input.is_action_pressed("speed_up"):
		change_time.emit(1.1)


func handle_bullet_collision():
	hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
	print("player got hit by a bullet")

