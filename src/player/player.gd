extends CharacterBody2D

@export var speed = 400
@export var Bullet : PackedScene
@export var fire_rate: float = 10
@onready var update_delta : float = 1 / fire_rate

var current_time: float = 0;

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	move(input_direction, delta)
	current_time += delta
	if (current_time < update_delta):
		return
	if Input.is_action_pressed("click"):
		current_time = 0
		shoot()
	
func move(input_direction: Vector2, delta):
	velocity = input_direction * speed
	move_and_slide()

	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Shooter.global_transform
	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	get_input(delta)
