extends Area2D

@export var speed: int = 10
@onready var object_off_board_notifier = $RocketOffBoardNotifier

func _ready() -> void:
	object_off_board_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(_delta) -> void:
	global_position.x += speed
	
func _on_screen_exited():
	queue_free()

func _on_area_entered(area: Area2D) -> bool:
	queue_free()
	area.die()
	
	return true
