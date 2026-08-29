extends Node

var levels = ["res://Main.tscn"]
var level_count = 0

func load_level():
	get_tree().change_scene_to_file(levels[level_count])
