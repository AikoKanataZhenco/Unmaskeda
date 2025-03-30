extends Node2D

@onready var message_label = $MessageLabelInstance

func _ready():
	# Initialization code if needed
	pass

func show_message(message: String):
	message_label.show_message(message)
