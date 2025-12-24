class_name Bullet

extends Area3D

var vertical_shot: int
var horizontal_shot: int
var speed: float = 10.
var damage: float
var max_range: float
@onready var range_timer: Timer = $RangeTimer


func _ready() -> void:
	range_timer.start(max_range)

func _physics_process(delta: float) -> void:
	position += Vector3(vertical_shot*speed*delta, 0, horizontal_shot*speed*delta)


func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		body.take_damage(damage)
		print(body.health)
		queue_free()
	elif body is StaticBody3D:
		queue_free()

func _on_range_timer_timeout() -> void:
	queue_free()
