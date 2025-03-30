extends Label

@export var display_time: float = 10.0

func _ready():
	visible = false

func show_message(message: String):
	text = message
	visible = true
	await get_tree().create_timer(display_time).timeout
	visible = false
