extends Path2D

@onready var enemy_rocket_path = $PathFollow2D
@onready var rocket_enemy = $PathFollow2D/RocketEnemy

func _ready():
	enemy_rocket_path.set_progress_ratio(0)

func _process(delta):
	enemy_rocket_path.progress_ratio += 0.25 * delta
	if enemy_rocket_path.progress_ratio > 0.94:
		queue_free()
