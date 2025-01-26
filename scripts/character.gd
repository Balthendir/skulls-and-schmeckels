extends CharacterBody2D


@export var speed := 400
var is_moving := false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	is_moving = !velocity.is_zero_approx()

func _physics_process(_delta: float) -> void:
	get_input()
	#if is_onboard:
		#if is_moving:
			#velocity += ship.linear_velocity
		#else:
			#velocity = ship.linear_velocity
	move_and_slide()
