extends Area2D

@export var message: String = "Default message"  # The message to display

@onready var message_label: Label = null

func _ready():
	# Connect the body_entered signal to a function
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if message_label:
			message_label.show_message(message)

func set_message_label(label: Label):
	message_label = label
