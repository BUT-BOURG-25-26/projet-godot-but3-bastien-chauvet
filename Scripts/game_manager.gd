extends Node

@export var room_scene: PackedScene = preload("res://Scenes/room_scene.tscn")

var player: Player

var main: MainScene
var camera: CustomCamera
var actual_room: Room

var cmpt1: int = 0
var cmpt2: int = 0

var nb_rooms: int = 0

func hasEnteredNewRoom(direction):
	var moving_camera_timer: Timer = main.timer
	actual_room = room_scene.instantiate()
	main.add_child(actual_room)
	
	var verticalMovement: int = 0
	var horizontalMovement: int = 0
	
	match direction:
		"north":
			cmpt1 += 1
			verticalMovement = 2
			camera.slideNorth = true
		"south":
			cmpt1 -= 1
			verticalMovement = -2
			camera.slideSouth = true
		"east":
			cmpt2 += 1
			horizontalMovement = 2
			camera.slideEast = true
		"west":
			cmpt2 -= 1
			horizontalMovement = -2
			camera.slideWest = true

	moving_camera_timer.start()
	actual_room.global_position = Vector3(cmpt1*16., 0, cmpt2*21.3)
	player.global_position += Vector3(verticalMovement, 0, horizontalMovement)

func _process(_delta: float) -> void:
	if(actual_room != null):
		if(actual_room.global_position.x == camera.global_position.x && actual_room.global_position.z == camera.global_position.z):
			camera.stopMoving()

func launch() -> void:
	player.visible = true
	main.room.visible = true
	main.gameplay_ui.visible = true
	main.main_menu.visible = false
	nb_rooms += 1
