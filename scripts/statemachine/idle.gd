extends PlayerState

var cannon

func _ready():
	Events.object_interacted.connect(on_object_interacted)

func enter(previous_state_path: String, data := {}) -> void:
	 # player.velocity.x = 0.0 ##somehow crashes at the moment. Maybe becasue player is not generated on startup?
	print("IM IDLE NOW!")

func physics_update(_delta: float) -> void:
	if Input.is_action_pressed("left") or \
	Input.is_action_pressed("right") or \
	Input.is_action_pressed("up") or \
	Input.is_action_pressed("down"):
		finished.emit(RUNNING)

func on_object_interacted(object):
	if object.is_in_group("Usable") and object.get("object_active") == false:
		finished.emit(USING_OBJECT)
