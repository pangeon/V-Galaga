extends Control

func display_score_to_end_screen(total_score):
	$Panel/Score.text = "SCORE: " + str(total_score)

func _on_button_pressed():
	get_tree().reload_current_scene()
