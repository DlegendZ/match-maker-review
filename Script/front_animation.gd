extends TextureRect

const SCALE_NORMAL : Vector2 = Vector2(1,1)
const SCALE_SMALL : Vector2 = Vector2(0.1,0.1)
const ROTATION : Vector2 = Vector2(-360.0, 360.0)
const DURATION	: Vector2 = Vector2(1,2)


func _ready() -> void:
	texture = img_manager.get_random_img()["img_path"]
	tweener()

func tweener() -> void:
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property(self, "rotation_degrees", randf_range(ROTATION.x, ROTATION.y), randf_range(DURATION.x, DURATION.y))
	tween.tween_property(self, "scale", SCALE_SMALL, randf_range(DURATION.x, DURATION.y)).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(change_texture)
	tween.tween_property(self, "scale", SCALE_NORMAL, randf_range(DURATION.x, DURATION.y))
	tween.tween_property(self, "rotation_degrees", randf_range(ROTATION.x, ROTATION.y), randf_range(DURATION.x, DURATION.y))

func change_texture() -> void :
	texture = img_manager.get_random_img()["img_path"]
	return
