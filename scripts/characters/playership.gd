extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * speed



func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()


func _on_deck_body_entered(_body: Node2D) -> void:
	if _body is Player && _body.get_parent() != self:
		_body.reparent.call_deferred(self)

func _on_deck_body_exited(_body: Node2D) -> void:
	if _body is Player and _body.get_parent() != get_node("/root/Level/"):
		_body.reparent.call_deferred(get_node("/root/Level/"))
