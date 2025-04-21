extends Control
@export var level_button : PackedScene
@onready var level_sel: HBoxContainer = $MarginContainer/level_sel

func _ready() -> void:
	for x in GameManager.levels :
		var level_button_instance = level_button.instantiate()
		level_sel.add_child(level_button_instance)
		level_button_instance.set_level_num(x)
