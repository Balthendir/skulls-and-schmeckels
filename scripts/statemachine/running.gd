extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("RUNNING NOW !")
	
	#player.animation_player.play("run")
	pass

func physics_update(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	player.velocity = input_direction * player.speed
	player.move_and_slide()

	#if not player.is_on_floor():
		#finished.emit(FALLING)
	#elif Input.is_action_just_pressed("move_up"):
		#finished.emit(JUMPING)
	if !input_direction:
		finished.emit(IDLE)
