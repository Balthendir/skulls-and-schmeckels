extends Node2D

@onready var interaction_area : InteractionArea = $InteractionArea
@onready var object_active = interaction_area.object_active
@onready var ship = self.get_parent()

var rotation_direction = 0

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	object_active = true
	await Events.interaction_finished

func _input(event):
	if object_active:		
		if event.is_action_pressed("interact"):
			Events.interaction_finished.emit(self)
			object_active = false

func _physics_process(delta: float) -> void:
	if object_active:
		if Input.is_action_just_pressed("left"):
			ship.rotation_speed = clamp(ship.rotation_speed - 0.5, -ship.MAX_ROTATION_SPEED, ship.MAX_ROTATION_SPEED)

		if Input.is_action_just_pressed("right"):
			ship.rotation_speed = clamp(ship.rotation_speed + 0.5, -ship.MAX_ROTATION_SPEED, ship.MAX_ROTATION_SPEED)

		if Input.is_action_just_pressed("up"):
			ship.movement_speed = clamp(ship.movement_speed + 2000, 0, ship.MAX_MOVEMENT_SPEED)

		if Input.is_action_just_pressed("down"):
			ship.movement_speed = clamp(ship.movement_speed - 2000, 0, ship.MAX_MOVEMENT_SPEED)

	ship.rotation += ship.rotation_speed * delta
	ship.velocity = ship.transform.x * ship.movement_speed * delta
	ship.move_and_slide()
