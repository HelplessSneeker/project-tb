extends EntitiyBase

@export var speed = 100;
@export var max_hp: int = 5

var player = null

func _ready() -> void:
	hp=max_hp

func die():
	queue_free()

func _on_hit(damage: int, k: Vector2) -> void:
	self._on_entity_hit(damage, k);
	
func _physics_process(delta):
	self._handle_knockback(delta);
	$AnimatedSprite2D.play("default")
	follow_player()
	move_and_slide()
	
func follow_player():
	if player && knockback == Vector2.ZERO:
		var direction = position.direction_to(player.position);
		velocity = direction * speed + knockback
		if(direction.y < 0):
			$AnimatedSprite2D.play("up")
		elif(direction.x < 0):
			$AnimatedSprite2D.play("left")
		elif(direction.x > 0):
			$AnimatedSprite2D.play("right")
	
func _on_detect_radius_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detect_radius_body_exited(body):
	if body.is_in_group("player"):
		player = null
