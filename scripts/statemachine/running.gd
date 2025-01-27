extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("RUNNING NOW !")
	pass

func physics_update(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	player.velocity = input_direction * player.speed
	player.move_and_slide()

	if !input_direction:
		finished.emit(IDLE)
