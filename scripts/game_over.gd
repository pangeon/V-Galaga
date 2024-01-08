extends Control

const high_score_scene = preload("res://scenes/high_score.tscn")
var high_score_instance = high_score_scene.instantiate()

func display_score_to_end_screen(total_score):
	$Panel/Score.text = "SCORE: " + str(total_score)
	high_score_instance.save_score_to_hall_of_fame(total_score)

func _on_button_restart_pressed():
	get_tree().reload_current_scene()

func _on_button_hi_score_pressed():
	high_score_instance.refresh_hall_of_fame()
	$Panel.visible = false
	$".".add_child(high_score_instance)
