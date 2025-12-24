class_name Enemy
extends CharacterBody3D

var health: float = 50
var speed: float = 10.

func _physics_process(delta: float) -> void:
	if (!is_on_floor()):
		velocity.y += get_gravity().y * delta
	move_and_slide()

func take_damage(damage: float) -> void:
	health -= damage
