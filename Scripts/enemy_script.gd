class_name Enemy
extends CharacterBody3D

func _physics_process(delta: float) -> void:
	if (!is_on_floor()):
		velocity.y += get_gravity().y * delta
	move_and_slide()
