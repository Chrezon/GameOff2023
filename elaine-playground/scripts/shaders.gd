extends Control

var animationPlayer
var shader

# Called when the node enters the scene tree for the first time.
func _ready():
	shader = get_node("TextureRect")
	animationPlayer = get_node("TextureRect/AnimationPlayer")
	shader.visible = false

func _on_player_slow_time_begin():
	shader.visible = true
	animationPlayer.play("Anim")
	
func _on_player_slow_time_end():
	shader.visible = false
	animationPlayer.play("RESET")
	
