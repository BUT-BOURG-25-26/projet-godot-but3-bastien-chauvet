class_name Bullet

extends Area3D

var speed: float = 10.

func _physics_process(delta: float) -> void:
	position.x += speed*delta
