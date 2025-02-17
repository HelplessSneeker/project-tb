extends Node2D

signal mob_died(xp_gain);

const mob_scene = preload('res://src/game/mob/mob.tscn')

@export var min_spawn_distance: float = 400;
@export var max_spawn_distance: float = 1000;
@export var spawn_time: float = 2;

@onready var player = get_node('../Player');

func _ready() -> void:
	$Timer.wait_time = spawn_time;

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
	mob.connect("died", Callable(self, '_on_mob_died'))

func _on_mob_died(xp_gain):
	emit_signal('mob_died', xp_gain);

func _on_timer_timeout() -> void:
	if(player):
		spawn_mob();
