extends Area2D

@export var speed = 900
@export var damage = 1
@export var knockback_modifier = 900;

#func _init() -> void:
	##$AnimatedSprite2D.play("default")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_bullet_body_entered(body: Node2D):
	if body.is_in_group("mobs"):
		body.emit_signal("hit", damage, global_position.direction_to(body.position) * knockback_modifier)
	queue_free()
