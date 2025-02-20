extends Area2D

@export var speed = 400


func _process(delta: float) -> void:
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += delta * velocity


func _on_projectile_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
