extends Node2D

signal cannonball(pos)

var can_shoot: bool = true

func get_input():
	#shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		can_shoot = false
		$shoot_cooldown.start()
		cannonball.emit($Ballspawn.global_position)

func _process(delta: float) -> void:
	get_input()


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
