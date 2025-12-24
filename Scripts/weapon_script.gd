class_name Weapon
extends Node3D

var attack_speed: float = 2
var attack_damage: float = 5
var attack_range: float = 1

@export var ammo: PackedScene = preload("res://Scenes/bullet_scene.tscn")

var reloaded: bool = true
@onready var reload_timer: Timer = $ReloadTimer


func shootUp() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	bullet_shot.vertical_shot = 1
	bullet_shot.global_position = global_position + Vector3(0, 0.25, 0)
	bullet_shot.rotation_degrees = Vector3(0, 0, 90)
	bullet_shot.scale = Vector3(0.2, 0.2, 0.2)
	bullet_shot.damage = attack_damage
	bullet_shot.max_range = attack_range
	GameManager.actual_room.add_child(bullet_shot)
	
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootDown() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	bullet_shot.vertical_shot = -1
	bullet_shot.global_position = global_position + Vector3(0, 0.25, 0)
	bullet_shot.rotation_degrees = Vector3(0, 0, 90)
	bullet_shot.scale = Vector3(0.2, 0.2, 0.2)
	bullet_shot.damage = attack_damage
	bullet_shot.max_range = attack_range
	GameManager.actual_room.add_child(bullet_shot)
	
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootRight() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	bullet_shot.horizontal_shot = 1
	bullet_shot.global_position = global_position + Vector3(0, 0.25, 0)
	bullet_shot.rotation_degrees = Vector3(90, 0, 0)
	bullet_shot.scale = Vector3(0.2, 0.2, 0.2)
	bullet_shot.damage = attack_damage
	bullet_shot.max_range = attack_range
	GameManager.actual_room.add_child(bullet_shot)
	
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootLeft() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	bullet_shot.horizontal_shot = -1
	bullet_shot.global_position = global_position + Vector3(0, 0.25, 0)
	bullet_shot.rotation_degrees = Vector3(90, 0, 0)
	bullet_shot.scale = Vector3(0.2, 0.2, 0.2)
	bullet_shot.damage = attack_damage
	bullet_shot.max_range = attack_range
	GameManager.actual_room.add_child(bullet_shot)
	
	reloaded = false
	reload_timer.start(1/attack_speed)


func _on_timer_timeout() -> void:
	reloaded = true
	print("reloaded")
