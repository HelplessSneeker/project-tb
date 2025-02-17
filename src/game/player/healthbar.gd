extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_hit(damage: int) -> void:
	value -= damage
