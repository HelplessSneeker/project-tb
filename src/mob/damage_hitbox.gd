extends Area2D

@export var damage = 1
@export var damage_tic = 1

@onready var update_delta : float = 1 / damage_tic

var body_list = [];
var damage_time = 0;



func _physics_process(delta: float) -> void:
	for body_object in body_list:
		damage_time += delta
		if (damage_time < update_delta):
			return
		body_object.emit_signal("hit", damage)
		damage_time = 0;


func _on_body_entered(body: Node2D) -> void:
	if(!body.is_in_group("mobs")):
		body_list.append(body)


func _on_body_exited(body: Node2D) -> void:
	for body_object in body_list:
		if(body_object == body):
			body_list.erase(body_object)
