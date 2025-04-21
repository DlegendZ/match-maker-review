extends TextureButton
class_name memory_tiles
@onready var img: TextureRect = $frame/img
@onready var frame: TextureRect = $frame
var can_click_me : bool

var img_name : String

func _ready() -> void:
	SignalManager.on_selection_enabled.connect(clickable)

func set_up_img(img_data : Dictionary) :
	img_name = img_data["img_name"]
	img.texture = img_data["img_path"]
	turn_on(false)

func turn_on(stat : bool) :
	frame.visible = stat
	can_click_me = !stat

func _on_pressed() -> void:
	if can_click_me == true :
		turn_on(true)
		SignalManager.on_tiles_selected.emit(self)

func clickable(status : bool) -> void :
	can_click_me = status

func hide_selection() :
	scale = Vector2.ZERO
