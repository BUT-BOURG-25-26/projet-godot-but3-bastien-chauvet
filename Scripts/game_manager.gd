extends Node

@export var room_scene: PackedScene = preload("res://Scenes/room_scene.tscn")

var player: Player
var main: Node3D
var cmpt1: int = 0
var cmpt2: int = 0

func hasEnteredNewRoom(direction):
	var room: Room = room_scene.instantiate()
	main.add_child(room)
	
	var verticalMovement: int = 0
	var horizontalMovement: int = 0
	
	match direction:
		"north":
			cmpt1 += 1
			verticalMovement = 2
		"south":
			cmpt1 -= 1
			verticalMovement = -2
		"east":
			cmpt2 += 1
			horizontalMovement = 2
		"west":
			cmpt2 -= 1
			horizontalMovement = -2
		
	
	room.global_position = Vector3(cmpt1*16., 0, cmpt2*21.3)
	player.global_position += Vector3(verticalMovement, 0, horizontalMovement)
	
	
	
