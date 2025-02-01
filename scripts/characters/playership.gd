extends CharacterBody2D

const MAX_MOVEMENT_SPEED := 20000
const MAX_ROTATION_SPEED := 1.5

@export var movement_speed := 0
@export var rotation_speed := 0.0


#func _physics_process(delta):
	#if Input.is_action_just_pressed("ui_left"):
		#rotation_speed = clamp(rotation_speed - 0.5, -MAX_ROTATION_SPEED, MAX_ROTATION_SPEED)
#
	#if Input.is_action_just_pressed("ui_right"):
		#rotation_speed = clamp(rotation_speed + 0.5, -MAX_ROTATION_SPEED, MAX_ROTATION_SPEED)
#
	#if Input.is_action_just_pressed("ui_up"):
		#movement_speed = clamp(movement_speed + 2000, 0, MAX_MOVEMENT_SPEED)
#
	#if Input.is_action_just_pressed("ui_down"):
		#movement_speed = clamp(movement_speed - 2000, 0, MAX_MOVEMENT_SPEED)
#
	#rotation += rotation_speed * delta
	#velocity = transform.x * movement_speed * delta
	#move_and_slide()


func _on_deck_body_entered(_body: Node2D) -> void:
	if _body is Player && _body.get_parent() != self:
		_body.reparent.call_deferred(self)

func _on_deck_body_exited(_body: Node2D) -> void:
	if _body is Player and _body.get_parent() != get_node("/root/Level/"):
		_body.reparent.call_deferred(get_node("/root/Level/"))
