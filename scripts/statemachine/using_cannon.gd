extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("IM ON CANNON !")

func _input(event):
	if event.is_action_pressed("interact"):
		finished.emit(IDLE)
