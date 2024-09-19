extends Node2D

signal shoot

@export var fire_rate: float = 8

@onready var update_delta : float = 1 / fire_rate
@export var Bullet : PackedScene


var shoot_time: float = 0;
var cooldown = false;

	
func _physics_process(delta):
	shoot_time += delta
	if (shoot_time < update_delta):
		return
	cooldown = false;


func _on_shoot() -> void:
	if(!cooldown): 
		shoot_time = 0
		cooldown = true
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.transform = $ShooterMarker.global_transform
