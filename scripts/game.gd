extends Node2D

@export var lives = 3
@onready var player_scene = $Player

func _on_enemy_cleaner_area_entered(area: Area2D) -> void:
	area.die()
	
func _on_player_collision_with_enemy() -> void:
	lives -= 1
	if (lives < 1):
		print("Game over")
		player_scene.die()
		close()
	else:
		print("Lives: " + str(lives))

func close() -> void:
	get_tree().quit()
