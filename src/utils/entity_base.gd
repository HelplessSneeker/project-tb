class_name EntitiyBase
extends CharacterBody2D

signal hit(damage: int)
signal hp_changed(hp: int)
signal died();

var knockback = Vector2.ZERO;
var knockback_duration = 0.2;
var knockback_time = 0;
var invulnerable = false;
var dead = false;

var hp: int:
	set(value):
		hp = value
		emit_signal("hp_changed", hp)
		if hp <= 0:
			die()

func _on_entity_hit(damage: int, k: Vector2) -> void:
	if(!invulnerable && !dead):
		hp -=damage
	knockback = k;
	
func _handle_knockback(delta: float) -> void:
	velocity = Vector2.ZERO + knockback;
	knockback_time += delta
	if(knockback_time >= knockback_duration):
		knockback = Vector2.ZERO
		knockback_time = 0


func die():
	emit_signal('died')
