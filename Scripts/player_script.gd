class_name Player
extends CharacterBody3D

var health: int = 10
#var weapon: Weapon
var movement_speed: float = 10.
var movement_inputs: Vector3

func _physics_process(delta: float) -> void:
	read_move_inputs()
	movement_inputs *= movement_speed * delta
	if movement_inputs != Vector3.ZERO:
		velocity = movement_inputs * movement_speed
		move_and_slide()
	return

func read_move_inputs():
	movement_inputs.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	movement_inputs.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	movement_inputs = movement_inputs.normalized()
	return
