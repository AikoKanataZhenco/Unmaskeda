extends Node2D

@onready var message_label_scene = $MessageLabelInstance

func _ready():
	# Initialization code if needed
	pass

func show_message(message: String):
	message_label_scene.show_message(message)
