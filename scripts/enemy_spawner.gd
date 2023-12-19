extends Node2D

signal enemy_spawned(enemy_instance)
signal rocket_enemy_spawned(enemy_rocket_instance)

const enemy_scene = preload("res://scenes/enemy.tscn")
const path_enemy_rocket_scene = preload("res://scenes/rocket_enemy_path.tscn")

@onready var spawn_positions_container: Node2D = $SpawnPositions

func _on_timer_timeout() -> void:
	spawn_enemy()
	
func spawn_enemy() -> void:
	var spawn_positions: Array = spawn_positions_container.get_children()
	var random_position = spawn_positions.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_position.global_position
	emit_signal("enemy_spawned", enemy_instance)

func _on_rocket_enemy_time_spawner_timeout():
	spawn_rocket_enemy()
	
func spawn_rocket_enemy():
	var rocket_enemy_instance = path_enemy_rocket_scene.instantiate()
	emit_signal("rocket_enemy_spawned", rocket_enemy_instance)
	
