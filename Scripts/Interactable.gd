extends Node

# Signal to notify when the object is interacted with
signal interacted

# Method to call when the object is interacted with
func interact():
	emit_signal("interacted")
	# Add your interaction logic here
	print("Interacted with: ", self.name)


func _input(event):
	if event.is_action_pressed("ui_accept"):
		interact()
