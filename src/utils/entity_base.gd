class_name EntitiyBase
extends CharacterBody2D

signal hit(damage: int)

var knockback = Vector2.ZERO;
var knockback_duration = 0.2;
var knockback_time = 0;


var hp: int = 5:
	set(value):
		hp = value
		if hp <= 0:
			die()

func _on_entity_hit(damage: int, k: Vector2) -> void:
	hp -=damage
	knockback = k;
	
func _handle_knockback(delta: float) -> void:
	velocity = Vector2.ZERO + knockback;
	knockback_time += delta
	if(knockback_time >= knockback_duration):
		knockback = Vector2.ZERO
		knockback_time = 0


func die():
	pass
