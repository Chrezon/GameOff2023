extends Node2D

@export var player : Node2D
@export var group_name : String

func _process(delta):
	var closest : Node2D = null
	var closest_dist_squared : float = 100000
	var player_pos = player.position
	for node in get_tree().get_nodes_in_group(group_name):
		var node2d := node as Node2D
		var candidate_dist_sqr := node2d.position.distance_squared_to(player_pos)
		if candidate_dist_sqr < closest_dist_squared:
			closest = node2d
			closest_dist_squared = candidate_dist_sqr
	
	if closest:
		position = closest.position
