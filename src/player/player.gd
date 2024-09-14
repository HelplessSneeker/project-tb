extends CharacterBody2D

@export var speed = 400
@export var Bullet : PackedScene

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_just_pressed("click"):
		shoot()
	velocity = input_direction * speed
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Shooter.global_transform
	
func _physics_process(delta):
	get_input()
	move_and_slide()
