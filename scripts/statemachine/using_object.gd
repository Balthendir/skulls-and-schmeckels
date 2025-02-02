extends PlayerState

func _ready():
	Events.interaction_finished.connect(_on_interaction_finished)

func enter(previous_state_path: String, data := {}) -> void:
	
	print("IM ON OBJECT!")

func _on_interaction_finished(object):
	finished.emit(IDLE)
