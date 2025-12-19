class_name Player
extends CharacterBody3D

var health: int = 10
#var weapon: Weapon
var movement_speed: float = 1000. # 150.
var movement_inputs: Vector3
var max_jump: int = 1
var jump_count: int = 0

func _physics_process(delta: float) -> void:
	
	move(delta)
	jump(delta)
	move_and_slide()
	
	return

func move(delta):
	movement_inputs.x = Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")
	movement_inputs.z = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	movement_inputs = movement_inputs.normalized() * delta
	velocity.x = movement_inputs.x * movement_speed
	velocity.z = movement_inputs.z * movement_speed
	return

func jump(delta):
	if (!is_on_floor()):
		velocity.y += get_gravity().y * delta
	else:
		jump_count = 0
	if(jump_count < max_jump and Input.is_action_just_pressed("jump")):
		velocity.y = 5
		jump_count += 1
	return
