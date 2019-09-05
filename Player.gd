extends Node2D
#extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum{
	BEAR_TRAP,
	MINE
}
var motion = Vector2()
onready var kinematicBody = $KinematicBody2D
onready var trapType = BEAR_TRAP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_up"):
		motion.y = -80
	elif Input.is_action_pressed("ui_down"):
		motion.y = 80
	else:
		motion.y = 0
	
	kinematicBody.move_and_slide(motion)
	pass