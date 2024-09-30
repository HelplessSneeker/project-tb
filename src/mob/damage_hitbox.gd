extends Area2D

@export var damage = 1
@export var knockback_modifier = 500;

var body_list = [];


func _physics_process(delta: float) -> void:
	for body_object in body_list:
		var knockback = ( global_position.direction_to(body_object.position) ) * knockback_modifier;
		body_object.emit_signal("hit", damage, knockback);


func _on_body_entered(body: Node2D) -> void:
	if(!body.is_in_group("mobs")):
		body_list.append(body)


func _on_body_exited(body: Node2D) -> void:
	for body_object in body_list:
		if(body_object == body):
			body_list.erase(body_object)
