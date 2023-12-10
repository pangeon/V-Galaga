extends Node2D

@export var lives = 3
@onready var player_scene = $Player
@onready var hud = $UI/HUD

var score = 0

func _ready():
	hud.update_score_ui(score)
	hud.off_visible_left_lives(lives)

func _on_enemy_cleaner_area_entered(area: Area2D) -> void:
	area.die()
	
func _on_player_collision_with_enemy() -> void:
	lives -= 1
	hud.off_visible_left_lives(lives)
	update_score(false)
	if (lives < 1):
		print("Game over")
		player_scene.die()
		close()
		
func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("update_score", _on_enemy_died)
	add_child(enemy_instance)

func close() -> void:
	get_tree().quit()

func _on_enemy_died() -> void:
	update_score(true)
	hud.update_score_ui(score)

func update_score(flag):
	if flag:
		score += 100
	else:
		score -= 100
