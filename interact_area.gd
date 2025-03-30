extends Area2D

# Called when the node enters the scene tree
func _ready():
	# Connect the body_entered signal
	self.body_entered.connect(_on_body_entered)

# Function triggered when a body enters the area
func _on_body_entered(body: Node):
	if body is CharacterBody2D:
		print("CharacterBody2D entered the area!")
