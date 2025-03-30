extends Control

func _ready(): pass

func _on_start_pressed():
	Loader.change_level("res://Scene/HouseInt1.tscn")

func _on_quit_pressed() -> void: get_tree().quit()


func _on_button_pressed() -> void:
	Loader.change_level("res://scenes/levels/level_1.tscn")
