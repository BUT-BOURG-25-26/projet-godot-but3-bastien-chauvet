class_name MainScene
extends Node3D

@onready var player: Player = $Player
@onready var camera: Camera3D = $Camera3D
@export var timer: Timer


func _ready() -> void:
	GameManager.main = self
	GameManager.player = player
	GameManager.camera = camera
	timer = $Timer
