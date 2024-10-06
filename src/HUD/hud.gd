extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_hp_changed(hp: int) -> void:
	$Control/HealtBar.value = hp
	


func _on_player_set_max_hp(hp: int) -> void:
	$Control/HealtBar.max_value = hp
