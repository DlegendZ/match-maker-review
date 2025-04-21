extends TextureButton
@onready var label: Label = $Label
var local_level_num : int

#3. change scene to the game scene

func set_level_num(level_num : int) -> void :
	label.text = "Level %s" %level_num
	local_level_num = level_num

func _on_mouse_entered() -> void:
	scale = Vector2(1.05, 1.05)

func _on_mouse_exited() -> void:
	scale = Vector2(1, 1)

func _on_pressed() -> void:
	SignalManager.on_level_selected.emit()
	GameManager.level_selected = local_level_num
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
