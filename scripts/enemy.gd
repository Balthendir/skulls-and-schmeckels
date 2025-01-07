extends CharacterBody2D

const MAX_HEALTH = 5
@export var health = 5



func _on_ready():
	set_health_bar()
	$HealthBar.max_value = MAX_HEALTH

func _process(float):
	pass
	
	

func set_health_bar() -> void:
	$HealthBar.value = health
	

func _on_hurtbox_area_entered(_area: Area2D) -> void:
	health -= 1
	print ("Enemy hit!")
	set_health_bar()
	if health == 0:
		queue_free()
