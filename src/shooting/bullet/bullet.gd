extends Area2D

@export var speed = 900
@export var damage = 1

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_bullet_body_entered(body: Node2D):
	if body.is_in_group("mobs"):
		body.emit_signal("hit", damage)
	queue_free()
