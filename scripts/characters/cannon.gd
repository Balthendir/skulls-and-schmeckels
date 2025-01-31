extends Node2D

@onready var cannonball : PackedScene = load("res://scenes/cannonball.tscn")
@onready var interaction_area : InteractionArea = $InteractionArea

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0


var can_shoot: bool = true
var object_active: bool = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	object_active = !object_active

func get_input():
	if object_active:
		rotation_direction = Input.get_axis("left", "right")
		

func shoot_cannon():
	if Input.is_action_just_pressed("shoot") && object_active && can_shoot:
		can_shoot = false
		$shoot_cooldown.start()
		var instance = cannonball.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = $Ballspawn.global_position
		instance.rotation = global_rotation + PI/2
		print(rotation)
		print(global_rotation)

func _process(delta: float) -> void:
	rotation += rotation_direction * rotation_speed * delta
	
	shoot_cannon()
	get_input()

func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
