extends CharacterBody2D

signal hit(damage: int, knockback: float, vekotr: Vector2)

@export var damage = 1
@export var knockback = 100
@export var speed = 100;
@export var hp: int = 5:
	set(value):
		hp = value
		if hp <= 0:
			die()

var player = null
var has_knockback = false;

@onready var update_delta = 0;

func die():
	queue_free()

func _on_hit(damage: int, knockback, vektor) -> void:
	hp -=damage
	velocity = vektor * knockback
	has_knockback = knockback > 0
	
func _physics_process(delta):
	update_delta += delta
	if update_delta >=  0.5:
		has_knockback = false
		update_delta = 0;
		velocity = Vector2.ZERO;

	follow_player()
	move_and_slide()
	
func follow_player():
	if player && !has_knockback:
		velocity = position.direction_to(player.position) * speed
	
func _on_detect_radius_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detect_radius_body_exited(body):
	if body.is_in_group("player"):
		player = null


func _on_damage_hitbox_body_entered(body: Node2D) -> void:
	body.emit_signal("hit", damage, knockback,  position.direction_to(body.position))
