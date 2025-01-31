extends Node2D

@onready var interaction_area : InteractionArea = $InteractionArea
@export var speed = 400
@export var rotation_speed = 1.5
var ship

var rotation_direction = 0

var object_active: bool = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	ship = self.get_parent()


func _on_interact():
	object_active = !object_active

func get_input():
	if object_active:
		rotation_direction = Input.get_axis("left", "right")
		ship.velocity = ship.transform.x * Input.get_axis("down", "up") * speed
		


func _process(delta: float) -> void:
	ship.rotation += rotation_direction * rotation_speed * delta
	print(ship.velocity)
	get_input()
	ship.move_and_slide()
