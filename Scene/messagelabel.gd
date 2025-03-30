extends Label

@export var display_time: float = 10.0  # Display time in seconds

func _ready():
	visible = false  # Initially hidden

func show_message(message: String):
	text = message
	visible = true
	await get_tree().create_timer(display_time).timeout
	visible = false
