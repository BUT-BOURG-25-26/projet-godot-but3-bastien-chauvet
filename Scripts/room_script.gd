class_name Room
extends Node3D

@export var enemy_scene: PackedScene

@onready var north_door: CollisionShape3D = $Doors/NorthDoor.get_child(2).get_child(0)
@onready var south_door: CollisionShape3D = $Doors/SouthDoor.get_child(2).get_child(0)
@onready var east_door: CollisionShape3D = $Doors/EastDoor.get_child(2).get_child(0)
@onready var west_door: CollisionShape3D = $Doors/WestDoor.get_child(2).get_child(0)

@onready var queue_free_timer: Timer = $QueueFreeTimer

var nb_enemy: int = GameManager.nb_rooms
var is_completed: bool = false

func _process(_delta: float) -> void:
	if(is_completed):
		north_door.disabled = false
		south_door.disabled = false
		east_door.disabled = false
		west_door.disabled = false

func _on_north_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("north")
		queue_free_timer.start()


func _on_south_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("south")
		queue_free_timer.start()


func _on_east_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("east")
		queue_free_timer.start()
	
func _on_west_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("west")
		queue_free_timer.start()


func _on_spawn_enemy_timer_timeout() -> void:
	nb_enemy = randi_range(1, 4)
	for i in range(nb_enemy):
		var enemy: Enemy = enemy_scene.instantiate()
		add_child(enemy)
		enemy.position = Vector3(randf_range(-7, 6), 0.5, randf_range(-9, 9))


func _on_queue_free_timer_timeout() -> void:
	queue_free()
