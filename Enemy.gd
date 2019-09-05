extends Node2D

enum {
	IDLE,
	NEW_DIRECTION,
	MOVE,
	DIG,
	STEAL,
	GET_HIT,
	FLEE
}

const SPEED = 30
var state = MOVE
var direction = Vector2.RIGHT

func _ready():
	randomize()

func _process(delta):
	match state:
		IDLE:
			pass
		NEW_DIRECTION:
			direction = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			state = choose([IDLE, MOVE])
		MOVE:
			move(delta)
		DIG:
			pass
		STEAL:
			pass
		GET_HIT:
			pass
		FLEE:
			pass

func move(delta):
	position += direction * SPEED * delta
	
func choose(array):
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5,1.0])
	state = choose([IDLE, NEW_DIRECTION, MOVE])
