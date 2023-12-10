extends Area2D

@export var speed_x: int = 300
@export var speed_y: int = 50
@export var rotation_speed: float = 0.05
@export var enemy_flying_direction: int = randi_range(-1, 1)
@export var acceleration: int = 3

func _physics_process(delta: float) -> void:
	rotate(rotation_speed * delta)
	
	if (global_position.x < 1000):
		global_position.x += -speed_x*delta*acceleration
		global_position.y += speed_y*delta*acceleration*enemy_flying_direction
	else:
		global_position.x += -speed_x*delta
		global_position.y += -speed_y*delta*enemy_flying_direction
	
func die() -> void:
	queue_free()
	
func _on_body_entered(body) -> void:
	body.hurt_player()
	die()
