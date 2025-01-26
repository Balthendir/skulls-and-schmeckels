extends PlayerState

var cannon

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	print("IM IDLE NOW!")

func physics_update(_delta: float) -> void:
	if Input.is_action_pressed("left") or \
	Input.is_action_pressed("right") or \
	Input.is_action_pressed("up") or \
	Input.is_action_pressed("down"):
	
		finished.emit(RUNNING)
		
func _input(event):
		if event.is_action_pressed("interact") and InteractionManager.can_interact:
			## check if Interactable is a Interact Station: Cannon, Steering Wheel, Sails, ...
			if InteractionManager.active_areas.size() > 0 and InteractionManager.active_areas[0].get_parent().is_in_group("interact station"):
				print("TRYING TO INTERACT")
				finished.emit(USING_CANNON)
				#await InteractionManager.active_areas[0].interact.call()
