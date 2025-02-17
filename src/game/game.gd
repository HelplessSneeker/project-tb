extends Node2D



func _on_player_died() -> void:
	get_tree().change_scene_to_file("res://src/ui/start_menu.tscn")
