class_name DamageBase
extends CharacterBody2D

signal hit(damage: int)

var hp: int = 5:
	set(value):
		hp = value
		if hp <= 0:
			die()

	
func die():
	pass
