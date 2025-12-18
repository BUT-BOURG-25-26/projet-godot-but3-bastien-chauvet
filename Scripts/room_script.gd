class_name Room
extends Node3D

@export var enemy_scene: PackedScene

@onready var north_door: CollisionShape3D = $Doors/NorthDoor.get_child(2).get_child(0)
@onready var south_door: CollisionShape3D = $Doors/SouthDoor.get_child(2).get_child(0)
@onready var east_door: CollisionShape3D = $Doors/EastDoor.get_child(2).get_child(0)
@onready var west_door: CollisionShape3D = $Doors/WestDoor.get_child(2).get_child(0)

var nb_enemy: int
var is_completed: bool = true

func _ready() -> void:

	nb_enemy = randi_range(1, 4)
	for i in range(nb_enemy):
		var enemy: Enemy = enemy_scene.instantiate()
		add_child(enemy)
		enemy.global_position = Vector3(randf_range(-7, 6), 1, randf_range(-9, 9))


func _process(delta: float) -> void:
	if(is_completed):
		north_door.disabled = false
		south_door.disabled = false
		east_door.disabled = false
		west_door.disabled = false

func _on_north_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("north")
		#queue_free()


func _on_south_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("south")
		#queue_free()


func _on_east_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("east")
		#queue_free()
	
func _on_west_area_3d_body_entered(body: Node3D) -> void:
	if(body is Player):
		GameManager.hasEnteredNewRoom("west")
		#queue_free()
