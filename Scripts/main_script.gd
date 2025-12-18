class_name MainScene
extends Node3D

@onready var player: Player = $Player

func _ready() -> void:
	GameManager.main = self
	GameManager.player = player
