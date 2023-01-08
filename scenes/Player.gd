extends KinematicBody

export(NodePath) var animationtree

onready var _anim_tree = get_node(animationtree)
var gravity = Vector3.ZERO

func _physics_process(delta):
	var root_motion : Transform = _anim_tree.get_root_motion_transform()

	var direction = Vector3.ZERO

	var v = root_motion.origin / delta
	if is_on_floor():
		gravity = Vector3.ZERO
	else:
		gravity += Vector3(0.0, -9.83, 0.0)
	
	v += gravity
	
	if Input.is_action_pressed("ui_accept") and Input.is_action_pressed("ui_up"):
		_anim_tree["parameters/playback"].travel("Run-loop")
	elif Input.is_action_pressed("ui_up"):
		_anim_tree["parameters/playback"].travel("Walk-loop")
	else:
		_anim_tree["parameters/playback"].travel("Idle-loop")
		
	move_and_slide(v, Vector3.UP)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
