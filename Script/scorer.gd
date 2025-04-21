extends Control
@onready var timer_sel_same: Timer = $Timer
@onready var timer_sel_diff: Timer = $Timer2

var selection_list : Array = []
var move : int = 0
var pairs : int = 0

func _ready() -> void:
	SignalManager.on_tiles_selected.connect(check_tiles)

func check_tiles(tiles : memory_tiles) :
	selection_list.append(tiles)
	if selection_list.size() < 2 :
		return 
	move += 1
	SignalManager.on_move.emit()
	if selection_list[0].img_name == selection_list[1].img_name :
		pairs += 1
		SignalManager.on_pairs.emit()
		SignalManager.on_selection_enabled.emit(false)
		timer_sel_same.start()
	else :
		timer_sel_diff.start()
		SignalManager.on_selection_enabled.emit(false)

func timeout_same() :
	for x : memory_tiles in selection_list :
		x.hide_selection()
	selection_list.clear()
	SignalManager.on_selection_enabled.emit(true)

func timeout_diff() :
	for x : memory_tiles in selection_list :
		x.turn_on(false)
	selection_list.clear()
	SignalManager.on_selection_enabled.emit(true)
