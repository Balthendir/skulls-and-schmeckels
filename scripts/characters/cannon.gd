extends Node2D

@onready var cannonball : PackedScene = load("res://scenes/cannonball.tscn")
@onready var interaction_area : InteractionArea = $InteractionArea
@onready var object_active = interaction_area.object_active

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0
var can_shoot: bool = true

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	object_active = true

func _input(event):
	if object_active:
		rotation_direction = Input.get_axis("left", "right")
		
		if event.is_action_pressed("interact"):
			Events.interaction_finished.emit(self)
			object_active = false

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

func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
