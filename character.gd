extends CharacterBody2D


@export var speed := 400
var is_onboard := false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()


#func _on_ship_detector_area_entered(area: Area2D) -> void:
	#if area.is_in_group("ship"):
		#if area.get_parent() != self:
			#self.reparent(area)
			#
		###	call_deferred("addPlayerChild", area)
			#print("Workin?")

func addPlayerChild(body):
	body.add_child(self)





func _on_ship_detector_area_exited(area: Area2D) -> void:
	pass
