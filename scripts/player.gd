extends CharacterBody2D

signal collision_with_enemy

const start_speed: int = 50
const move_speed: int = 800
const falling_speed: int = 10
const area_width: int = 1280
const area_height: int = 720

var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container: Node = get_node("RocketContainer")

@onready var player_shoot_sound = $"../SFX/PlayerShootSound"

func _process(_delta) -> void:
	shoot()

func _physics_process(_delta) -> void:
	limit_area_movement(area_width, area_height)
	movement_config()
	move_and_slide()

func set_inertia(speed: int, falling: int) -> Vector2:
	return Vector2(speed, randi()%falling+1)

func movement_config() -> void:
	velocity = set_inertia(start_speed, falling_speed)
	
	if Input.is_action_pressed("up"): 
		velocity.y = -move_speed
	if Input.is_action_pressed("down"): 
		velocity.y = move_speed
	if Input.is_action_pressed("right"): 
		velocity.x = move_speed-200
	if Input.is_action_pressed("left"): 
		velocity.x = -move_speed+200
	
func limit_area_movement(width: int, height: int) -> void:
	if global_position.x < 0: 
		global_position.x = 0
	if global_position.y < 0: 
		global_position.y = 0
		
	if global_position.x > width:  
		global_position.x = width
	if global_position.y > height: 
		global_position.y = height
		
func shoot() -> void:
	var rocket_instance: Area2D = rocket_scene.instantiate()
	
	if Input.is_action_just_pressed("action"):
		player_shoot_sound.play()
		rocket_container.add_child(rocket_instance)
		rocket_instance.global_position = global_position
		rocket_instance.global_position.x += 110
		
func hurt_player() -> void:
	emit_signal("collision_with_enemy")

func die() -> void:
	queue_free()
