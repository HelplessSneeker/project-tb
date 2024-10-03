extends EntitiyBase

@export var max_hp: int = 5;
@export var speed = 400
@onready var invulnerability_duration = 1

var invulnerability_time = 0
var invulnerable = false;

func _init() -> void:
	hp = max_hp

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	move(input_direction)
	if Input.is_action_pressed("click"):
		$Shooter.emit_signal("shoot")
	
func move(input_direction: Vector2):
	if(input_direction.y < 0):
		$AnimatedSprite2D.play("up")
	elif(input_direction.x < 0):
		$AnimatedSprite2D.play("left")
	elif(input_direction.x > 0):
		$AnimatedSprite2D.play("right")

	else:
		$AnimatedSprite2D.play("default")
	velocity = input_direction * speed
	
func _physics_process(delta):
	$Shooter.look_at(get_global_mouse_position())
	get_input(delta)
	handle_invulnerable(delta)
	hanlde_knockback(delta)
	move_and_slide()


func hanlde_knockback(delta):
	if(self.knockback != Vector2.ZERO):
		self._handle_knockback(delta);
		
func handle_invulnerable(delta):
	invulnerability_time += delta
	if(invulnerability_time >= invulnerability_duration):
		invulnerability_time = 0;
		invulnerable = false
		
func die():
	get_tree().change_scene_to_file("res://src/ui/start_menu.tscn")
	
func _on_hit(damage: int, k: Vector2) -> void:
	if(!invulnerable ):
		invulnerable = true;
		self._on_entity_hit(damage, k);
