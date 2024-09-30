extends Area2D

@export var speed = 900
@export var damage = 1
@export var knockback = 900;

var knockback_vektor = Vector2.ZERO

func _physics_process(delta):
	position += transform.x * speed * delta
	knockback_vektor = position + transform.x * delta * knockback 

func _on_bullet_body_entered(body: Node2D):
	if body.is_in_group("mobs"):
		body.emit_signal("hit", damage, knockback_vektor)
	queue_free()
