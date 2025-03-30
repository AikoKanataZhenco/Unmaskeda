extends CharacterBody2D

const speed = 30 
var current_state = Idle

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false
enum {
	Idle,
	NewDirection,
	Move
}
var player_in_area = false

func _ready():
	randomize()
	start_pos = position
	$Timer.start()  # Start the timer to change states

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("Timeline")
	
	if is_roaming:
		match current_state:
			Idle:
				$AnimatedSprite2D.play("Idle1")
			NewDirection:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.DOWN, Vector2.LEFT])
				current_state = Move  # Transition to Move state after choosing a new direction
			Move:
				move(delta)

func run_dialogue(dialogue_string):
	is_chatting = true
	is_roaming = false
	Dialogic.start(dialogue_string)
	$Timer.start()

func choose(array):
	array.shuffle()
	return array.front()

func move(delta):
	if !is_chatting:
		velocity = dir * speed
		move_and_slide()  # Call without arguments
		if dir == Vector2.RIGHT:
			$AnimatedSprite2D.play("WalkR")
		elif dir == Vector2.UP:
			$AnimatedSprite2D.play("WalkB_up")
		elif dir == Vector2.DOWN:
			$AnimatedSprite2D.play("WalkF_down")
		elif dir == Vector2.LEFT:
			$AnimatedSprite2D.play("WalkL")

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])  # Set a new wait time
	current_state = choose([Idle, NewDirection, Move])  # Randomly choose the next state

	if is_chatting:
		is_chatting = false
		is_roaming = true
		# Display message that the player can go to the new area
		var main_node = get_tree().root.get_node("MainNode")
		if main_node:
			main_node.show_message("Ts works now gng lol")
		else:
			print("MainNode not found!")
		#get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")  # Change to your desired scene

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
