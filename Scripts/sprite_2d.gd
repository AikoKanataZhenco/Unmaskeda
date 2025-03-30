extends Node2D

var camera : Camera2D
var player : Node2D

func _ready():
	camera = get_viewport().get_camera_2d()
	player = $Player  # Assuming the Player node is a child of the current node

func _process(_delta):
	self.global_position = camera.global_position
	for child in get_children():
		if child is Sprite2D:
			child.global_position = camera.global_position + (camera.global_position - child.global_position) * 0.5
