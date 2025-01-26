extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("IM ON CANNON !")
	
	#player.animation_player.play("run")
	pass

func physics_update(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")

func _input(event):
	if event.is_action_pressed("interact"):
		finished.emit(IDLE)
