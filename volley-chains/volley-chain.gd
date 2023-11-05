extends Resource
class_name VolleyChain

@export var default_delay : float = 0.2
@export var chain : Array[Volley]
var _idx = 0

# returns the delay required
func shoot_next(origin: Vector2, direction: Vector2, root: Node2D) -> float:
	var next_idx = _get_next_idx(_idx)
	var ret = default_delay
	
	# peek next volly. if it's a delay override, use its delay instead, and 
	# skip it next time (we don't wanna shoot a Delay)
	if chain[next_idx] is DelayOverride:
		ret = chain[next_idx].delay
		next_idx = _get_next_idx(next_idx)
	
	chain[_idx].shoot(origin, direction, root)
		
	_idx = next_idx

	return ret
	
func _get_next_idx(idx: int):
	idx += 1
	if idx >= len(chain):
		idx = 0
	return idx
