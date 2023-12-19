extends Area2D

signal update_score

func die() -> void:
	emit_signal("update_score")
	queue_free()
	
func _on_body_entered(body) -> void:
	body.hurt_player()
	die()
