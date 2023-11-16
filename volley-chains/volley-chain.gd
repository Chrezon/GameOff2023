extends Resource
class_name VolleyChain

@export_enum("DOWN", "AT PLAYER") var targeting: String = "DOWN"
@export var default_delay : float = 0.2
@export var chain : Array[Volley]
var _idx = 0

# returns the delay required
func shoot_next(player_pos: Vector2, root: Node2D):
	var next_idx = _get_next_idx(_idx)
	var ret = default_delay

	# peek next volly. if it's a delay override, use its delay instead, and 
	# skip it next time (we don't wanna shoot a Delay)
	if chain[next_idx] is DelayOverride:
		ret = chain[next_idx].delay
		next_idx = _get_next_idx(next_idx)
	
	var direction = Vector2.DOWN if targeting == "DOWN" else player_pos - chain[_idx].get_origin()
	chain[_idx].shoot(direction, root)
	
	var ended = next_idx <= _idx
	_idx = next_idx

	return [ret, ended]
	
func _get_next_idx(idx: int) -> int:
	idx += 1
	if idx >= len(chain):
		idx = 0
	return idx
