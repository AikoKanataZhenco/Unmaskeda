extends CharacterBody2D

const speed = 30 
var current_state = Idle

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

enum {
	Idle,
	new_direction,
	Move
}

func _ready():
	randomize()
	start_pos = position
	$Timer.start()  # Start the timer to change states
	$Timer.wait_time = choose([0.5, 1, 1.5])  # Set initial wait time
	$Timer.connect("timeout", Callable(self, "_on_timer_timeout"))  # Connect the timer's timeout signal

func _physics_process(delta):
	if is_roaming:
		match current_state:
			Idle:
				$AnimatedSprite2D.play("Idle1")
			new_direction:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.DOWN, Vector2.LEFT])
				current_state = Move  # Transition to Move state after choosing a new direction
			Move:
				move(delta)

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
	current_state = choose([Idle,new_direction, Move])  # Randomly choose the next state


func _on_chat_detection_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_chat_detection_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
