extends Node2D

#load scenes
var cannonball_scene: PackedScene = load("res://scenes/cannonball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta) -> void:
	pass

func _on_cannon_cannonball(pos) -> void:
	var cannonball = cannonball_scene.instantiate()
	
	$PlayerShip/Cannonballs.add_child(cannonball)
	
	

	print("Cannon shot!")
	
