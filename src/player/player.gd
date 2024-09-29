extends EntitiyBase

@export var max_hp: int = 5;

@export var speed = 400

func _init() -> void:
	hp = max_hp

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	move(input_direction)
	if Input.is_action_pressed("click"):
		$Shooter.emit_signal("shoot")
	
func move(input_direction: Vector2):
	velocity = input_direction * speed
	move_and_slide()
	
func _physics_process(delta):
	$Shooter.look_at(get_global_mouse_position())
	get_input(delta)
	
func die():
	get_tree().change_scene_to_file("res://src/ui/start_menu.tscn")
	
func _on_hit(damage: int, k: Vector2) -> void:
	self._on_entity_hit(damage, k);
