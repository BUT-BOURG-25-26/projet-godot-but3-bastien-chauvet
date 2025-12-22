class_name Weapon
extends Node

var attack_speed: float = 2
var attack_damage: float
var range: float

var reloaded: bool = true
@onready var reload_timer: Timer = $ReloadTimer


func shootUp() -> void :
		print("up")
		reloaded = false
		reload_timer.start(1/attack_speed)

func shootDown() -> void :
		print("down")
		reloaded = false
		reload_timer.start(1/attack_speed)

func shootRight() -> void :
		print("right")
		reloaded = false
		reload_timer.start(1/attack_speed)

func shootLeft() -> void :
		print("left")
		reloaded = false
		reload_timer.start(1/attack_speed)


func _on_timer_timeout() -> void:
	reloaded = true
	print("reloaded")
