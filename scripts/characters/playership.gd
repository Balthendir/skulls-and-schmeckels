extends CharacterBody2D

const MAX_MOVEMENT_SPEED := 500
const ACCELERATION := 50
const DECELERATION := 20

var max_rotation_speed := 0.1
var movement_speed := 0
var rotation_speed := 0.0


func _on_deck_body_entered(_body: Node2D) -> void:
	if _body is Player && _body.get_parent() != self:
		_body.reparent.call_deferred(self)

func _on_deck_body_exited(_body: Node2D) -> void:
	if _body is Player and _body.get_parent() != get_node("/root/Level/"):
		_body.reparent.call_deferred(get_node("/root/Level/"))
