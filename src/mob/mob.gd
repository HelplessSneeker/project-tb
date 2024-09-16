extends CharacterBody2D

signal hit(damage: int, knockback: float, vekotr: Vector2)

@export var speed = 100;
@export var hp: int = 5:
	set(value):
		hp = value
		if hp <= 0:
			die()

var player = null

func die():
	queue_free()


func _on_hit(damage: int, knockback, vekotr) -> void:
	hp -=damage
	velocity = vekotr * knockback
	
func _physics_process(delta):
	if player:
		velocity = position.direction_to(player.position) * speed
	move_and_slide()
	
func _on_DetectRadius_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_DetectRadius_body_exited(body):
	if body.is_in_group("player"):
		player = null
