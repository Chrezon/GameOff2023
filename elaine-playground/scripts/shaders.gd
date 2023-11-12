extends Control

var animationPlayer
var pixelize
var aberration

# I shall hard code some shader controls

# Called when the node enters the scene tree for the first time.
func _ready():
	aberration = get_node("Aberration")
	aberration.visible = false
	pixelize = get_node("Pixelize")
	pixelize.visible = false
	animationPlayer = get_node("AnimationPlayer")
	globals.change_time_begin.connect(_on_change_time_begin)
	globals.change_time_end.connect(_on_change_time_end)
	# shader.visible = false
	# visible = false

func _on_change_time_begin():
	# shader.visible = true
	aberration.visible = true
	pixelize.visible = true
	animationPlayer.play("Anim")
	
func _on_change_time_end():
	aberration.visible = false
	pixelize.visible = false
	# shader.visible = false
	animationPlayer.play("RESET")
	
