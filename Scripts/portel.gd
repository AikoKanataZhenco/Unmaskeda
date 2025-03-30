extends Area2D

@export var fade_duration: float = 0.5
@export var hold_time: float = 0.2

# Make sure we start with the correct color
func _ready() -> void:
	# Initialize CanvasModulate to normal color
	$CanvasModulate.color = Color(1, 1, 1, 1)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# Start the fade transition
		fade_to_black_and_teleport(body)

func fade_to_black_and_teleport(player: Node2D) -> void:
	# Disable player controls during teleportation
	if player.has_method("set_controls_enabled"):
		player.set_controls_enabled(false)
	
	# Fade to black
	var tween = create_tween()
	tween.tween_property($CanvasModulate, "color", Color(0, 0, 0, 1), fade_duration)
	await tween.finished
	
	# Hold at black for a moment
	await get_tree().create_timer(hold_time).timeout
	
	# Teleport player
	player.global_position = $Marker2D.global_position
	
	# Fade back to normal
	tween = create_tween()
	tween.tween_property($CanvasModulate, "color", Color(1, 1, 1, 1), fade_duration)
	await tween.finished
	
	# Re-enable player controls
	if player.has_method("set_controls_enabled"):
		player.set_controls_enabled(true)
