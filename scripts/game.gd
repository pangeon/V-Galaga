extends Node2D

@export var lives = 3
@onready var player_scene = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

@onready var game_music = $SFX/GameMusic
@onready var enemy_dead_sound = $SFX/EnemyDeadSound
@onready var lost_live_sound = $SFX/LostLiveSound
@onready var game_over_sound = $SFX/GameOverSound

var game_over_scene = preload("res://scenes/game_over.tscn")
var score = 0

func _ready():
	game_music.play()
	hud.update_score_ui(score)
	hud.off_visible_left_lives(lives)
	
	# init high_score.dat file
	if not FileAccess.file_exists("res://high_score.dat"):
		var file = FileAccess.open("res://high_score.dat", FileAccess.WRITE)
		file.store_string("1. 6000\n2. 5000\n3. 4000\n4. 3000\n5. 2000\n6. 1000")
		file.close()

func _on_enemy_cleaner_area_entered(area: Area2D) -> void:
	area.queue_free()
	
func _on_player_collision_with_enemy() -> void:
	lives -= 1
	hud.off_visible_left_lives(lives)
	lost_live_sound.play()
	score -= 100 # when enemy hit player you get 0 points: -100+100
	if (lives < 1):
		player_scene.die()
		game_over_sound.play()
		game_music.stop()
		
		await get_tree().create_timer(1.5).timeout
		
		var end_screen_instance = game_over_scene.instantiate()
		end_screen_instance.display_score_to_end_screen(score)
		ui.add_child(end_screen_instance)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("update_score", _on_enemy_died)
	add_child(enemy_instance)

func close() -> void:
	get_tree().quit()

func _on_enemy_died() -> void:
	score += 100
	hud.update_score_ui(score)
	enemy_dead_sound.play()

func _on_rocket_enemy_died() -> void:
	score += 400
	hud.update_score_ui(score)
	enemy_dead_sound.play()

func _on_enemy_spawner_rocket_enemy_spawned(enemy_rocket_instance):
	add_child(enemy_rocket_instance)
	enemy_rocket_instance.rocket_enemy.connect("update_score", _on_rocket_enemy_died)
