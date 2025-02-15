extends Node2D

const mob_scene = preload('res://src/mob/mob.tscn')

@export var min_spawn_distance: float = 200;
@export var max_spawn_distance: float = 500;

@onready var player = get_node('../Player');

func spawn_mob():
	
	# Calculate a random angle in radians
	var angle = randf_range(0, 2 * PI)
	
	# Calculate a random distance between min and max
	var distance = randf_range(min_spawn_distance, max_spawn_distance)
	
	# Convert polar coordinates (angle, distance) to Cartesian coordinates (x, z)
	var offset = Vector2(cos(angle), sin(angle)) * distance
	
	# Calculate the spawn position relative to the player
	var spawn_position = player.position + offset
	
	 # Instantiate the mob
	var mob = mob_scene.instantiate()
	get_tree().root.get_node('Game').add_child(mob) 
	
	# Set the mob's position and player
	mob.position = spawn_position
	mob.player = player


func _on_timer_timeout() -> void:
	if(player):
		spawn_mob();
