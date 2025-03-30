extends CanvasModulate

func _on_Area2D_body_entered(body):
	color = Color(0, 0, 0, 1)  # Immediately go to black
	await get_tree().create_timer(4.0).timeout  # Wait for 4 seconds
	fade_to_black_and_out()

func fade_to_black_and_out() -> void:
	# Fade out the screen
	for i in range(100):
		color = Color(0, 0, 0, lerp(1, 0, i / 100.0))
		await get_tree().create_timer(0.01).timeout
	
	# Reset the color to its original value
	color = Color(1, 1, 1, 1)
