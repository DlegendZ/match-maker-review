extends Node
var array_img : Array = []
func _ready() -> void:
	load_img()

func load_img() -> void: #load img from the storage
	var path = "res://Assets/Pixelart/Big (120x120) PNG/"
	var open_file = DirAccess.open(path)
	if open_file == null :
		print("Null_error")
		return
	var file_content = open_file.get_files()
	for content : String in file_content :
		if content.ends_with(".png") :
			add_img(content, path)
	#for content : Dictionary in array_img :
		#printt("img_name :" + content["img_name"], "img_path :" + content["img_path"])

func add_img(content : String, path : String) -> void: #add loaded img to the array
	var full_path :String = path + content
	var img_dict : Dictionary = {
		"img_name" = content.rstrip(".png"),
		"img_path" = load(full_path)
	}
	array_img.append(img_dict)
	return

func shuffle() -> void: #shuffle the array_img
	array_img.shuffle()
	return

func get_random_img() -> Dictionary:
	return array_img.pick_random()

func get_spes_img(index : int) -> Dictionary:
	return array_img[index]
