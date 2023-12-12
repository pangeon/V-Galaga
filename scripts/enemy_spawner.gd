extends Node2D

signal enemy_spawned(enemy_instance)

const enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions_container: Node2D = $SpawnPositions

func _on_timer_timeout() -> void:
	spawn_enemy()
	
func spawn_enemy() -> void:
	var spawn_positions: Array = spawn_positions_container.get_children()
	var random_position = spawn_positions.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
