extends Control
@onready var move_label: Label = $NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer/move_label
@onready var time_label: Label = $NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer2/time_label


func show_game_panel(move : int, time : int) -> void :
	show()
	move_label.text = str(move)
	time_label.text = str(time)

func on_exit_button_pressed() :
	hide()
	get_tree().change_scene_to_file("res://Scenes/lobby_scene.tscn")
