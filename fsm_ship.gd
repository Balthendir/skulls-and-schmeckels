extends RigidBody2D


var thrust = Vector2(1000, 0)
var speed = 20
var torque = 2000

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up"):
		state.apply_force(thrust.rotated(rotation) * speed)
	else:
		state.apply_force(Vector2())
	var rotation_direction = 0
	if Input.is_action_pressed("ui_right"):
		rotation_direction += 1
	if Input.is_action_pressed("ui_left"):
		rotation_direction -= 1
	state.apply_torque(rotation_direction * torque * 1000)
	
