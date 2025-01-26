extends Node2D

@onready var cannonball : PackedScene = load("res://scenes/cannonball.tscn")
@onready var interaction_area : InteractionArea = $InteractionArea
@onready var player = get_tree().get_first_node_in_group("player")

signal cannon_boarded

var can_shoot: bool = true
var cannon_active: bool = false


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	cannon_boarded.emit()
	print(player)
	if cannon_active:
		cannon_active = false
	else:
		cannon_active = true




func get_input():
	if cannon_active:
		look_at(get_global_mouse_position())

func shoot_cannon():
	if Input.is_action_just_pressed("shoot") && cannon_active && can_shoot:
		can_shoot = false
		$shoot_cooldown.start()
		var instance = cannonball.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = $Ballspawn.global_position
		instance.rotation = global_rotation + PI/2
		
func _process(float) -> void:
	shoot_cannon()
	get_input()
	

func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
