extends Node

var levels : Dictionary = {
	1 : {"rows" : 2, "cols" : 2},
	2 : {"rows" : 4, "cols" : 4},
	3 : {"rows" : 6, "cols" : 6},
	4 : {"rows" : 8, "cols" : 8}
}

var level_selected

func get_level_selection() -> Dictionary :
	var column = levels[level_selected]["cols"]
	var row = levels[level_selected]["rows"]
	var total_tiles = column * row
	var num_pairs = total_tiles/2
	var img_list_tiles : Array = []
	img_manager.array_img.shuffle()
	for x in range(num_pairs) :
		img_list_tiles.append(img_manager.get_spes_img(x))
		img_list_tiles.append(img_manager.get_spes_img(x))
	img_list_tiles.shuffle()
	return {
		"number_pairs" : num_pairs,
		"column" : column,
		"img_list" : img_list_tiles
	}
