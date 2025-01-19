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


func _on_deck_body_entered(_body: Node2D) -> void:
	if _body is Player && _body.get_parent() != self:
		_body.reparent.call_deferred(self)

func _on_deck_body_exited(_body: Node2D) -> void:
	if _body is Player and _body.get_parent() != get_node("/root/Level/"):
		_body.call_deferred("reparent", get_node("/root/Level/"))
