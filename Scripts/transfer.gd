extends Area2D

var entered = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if not entered:
		entered = true
		Loader.change_level("res://Scene/game_lvl.tscn")


func _on_body_exited(body) -> void:
	entered = false
