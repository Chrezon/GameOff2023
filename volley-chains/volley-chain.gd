extends Resource
class_name VolleyChain

@export var default_delay : float
@export var chain : Array[Volley]
var _idx = 0

# returns the delay required
func shoot_next(origin: Vector2, direction: Vector2, root: Node2D) -> float:
	chain[_idx].shoot(origin, direction, root)
	var ret = default_delay
	
	if chain[_idx] is Delay:
		ret = chain[_idx].delay
		
	_idx += 1
	if _idx >= len(chain):
		_idx = 0
	
	return ret
	
