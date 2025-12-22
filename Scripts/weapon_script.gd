class_name Weapon
extends Node

var attack_speed: float = 2
var attack_damage: float
var attack_range: float

@export var ammo: PackedScene = preload("res://Scenes/bullet_scene.tscn")

var reloaded: bool = true
@onready var reload_timer: Timer = $ReloadTimer


func shootUp() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	GameManager.player.add_child(bullet_shot)
	bullet_shot.global_position.y = 0.25
	bullet_shot.rotation.z = 90
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootDown() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	GameManager.player.add_child(bullet_shot)
	bullet_shot.global_position.y = 0.25
	bullet_shot.rotation.z = 90
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootRight() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	GameManager.player.add_child(bullet_shot)
	bullet_shot.global_position.y = 0.25
	bullet_shot.rotation.x = 90
	reloaded = false
	reload_timer.start(1/attack_speed)

func shootLeft() -> void :
	var bullet_shot: Bullet = ammo.instantiate()
	GameManager.player.add_child(bullet_shot)
	bullet_shot.global_position.y = 0.25
	bullet_shot.rotation.x = 90
	reloaded = false
	reload_timer.start(1/attack_speed)


func _on_timer_timeout() -> void:
	reloaded = true
	print("reloaded")
