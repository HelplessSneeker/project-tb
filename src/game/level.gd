extends Node

var mobs: Array = [];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mobs = get_tree().get_nodes_in_group("mobs")
	if(mobs.size() == 0):
		get_tree().change_scene_to_file("res://src/ui/start_menu.tscn")
