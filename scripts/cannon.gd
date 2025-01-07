extends Node2D

@onready var cannonball : PackedScene = load("res://scenes/cannonball.tscn")

var can_shoot: bool = true

func shoot_cannon():
	if Input.is_action_just_pressed("shoot") and can_shoot:
		can_shoot = false
		$shoot_cooldown.start()
		var instance = cannonball.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = $Ballspawn.global_position
		instance.rotation = get_parent().global_rotation
		
func _process(float) -> void:
	shoot_cannon()
	

func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
