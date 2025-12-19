class_name CustomCamera
extends Camera3D

@export var slideNorth: bool = false
@export var slideSouth: bool = false
@export var slideEast: bool = false
@export var slideWest: bool = false


func _physics_process(delta: float) -> void:
	if(slideNorth):
		global_translate(Vector3(16, 0, 0)*delta)
	if(slideSouth):
		global_translate(Vector3(-16, 0, 0)*delta)
	if(slideEast):
		global_translate(Vector3(0, 0, 21.3)*delta)
	if(slideWest):
		global_translate(Vector3(0, 0, -21.3)*delta)

func stopMoving() -> void:
	slideNorth = false
	slideSouth = false
	slideEast = false
	slideWest = false

func _on_timer_timeout() -> void:
	stopMoving()
	global_position.x = GameManager.actual_room.global_position.x - 6.5
	global_position.z = GameManager.actual_room.global_position.z
