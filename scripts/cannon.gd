extends Node2D

@onready var cannonball : PackedScene = load("res://scenes/cannonball.tscn")

var can_shoot: bool = true

func get_input():
	look_at(get_global_mouse_position())

func shoot_cannon():
	if Input.is_action_just_pressed("shoot") and can_shoot:
		can_shoot = false
		$shoot_cooldown.start()
		var instance = cannonball.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = $Ballspawn.global_position
		instance.rotation = global_rotation + PI/2
		
func _process(float) -> void:
	shoot_cannon()
	get_input()
#lul
func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
