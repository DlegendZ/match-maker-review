extends Control
@export var tiles : PackedScene
@onready var grid_container: GridContainer = %GridContainer
@onready var pairs_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/pairs_box/Label2
@onready var move_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/move_box/Label2
@onready var scorer: Control = $scorer
@onready var timer_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/time_box/Label2
@onready var timer: Timer = $Timer
@onready var game_over: Control = $game_over


var img_list : Array
var max_pairs : int
var time_passed : int = 0

func _ready() -> void:
	var current_data : Dictionary = GameManager.get_level_selection()
	var current_level = GameManager.level_selected
	max_pairs = current_data["number_pairs"]
	grid_container.columns = current_data["column"]
	img_list = current_data["img_list"]
	
	init_label()
	
	for img_data in img_list :
		add_tiles(img_data)
	SignalManager.on_move.connect(update_label_move)
	SignalManager.on_pairs.connect(update_label_pairs)

func init_label() :
	pairs_label.text = "%s/%s" %[scorer.pairs, max_pairs]
	move_label.text = str(scorer.move)
	timer_label.text = str(time_passed)

func add_tiles(img_data : Dictionary) :
	var tiles_instance = tiles.instantiate()
	grid_container.add_child(tiles_instance)
	tiles_instance.set_up_img(img_data)

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/lobby_scene.tscn")

func update_label_move() -> void : 
	move_label.text = str(scorer.move)

func update_label_pairs() -> void :
	pairs_label.text = "%s/%s" %[scorer.pairs, max_pairs]
	if (scorer.pairs == max_pairs) :
		on_game_over()

func update_label_timer() -> void :
	time_passed += 1
	timer_label.text = str(time_passed)

func on_game_over() -> void :
	timer.stop()
	game_over.show_game_panel(scorer.move, time_passed)
