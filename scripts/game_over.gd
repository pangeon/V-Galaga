extends Control

var high_score_scene = preload("res://scenes/high_score.tscn")
var score_to_check = 0

func display_score_to_end_screen(total_score):
	$Panel/Score.text = "SCORE: " + str(total_score)
	score_to_check = total_score

func _on_button_pressed():
	get_tree().reload_current_scene()

func _on_button_hi_score_pressed():
	var high_score_instance = high_score_scene.instantiate()
	high_score_instance.refresh_hall_of_fame()
	high_score_instance.save_score_to_hall_of_fame(score_to_check)
	high_score_instance.refresh_hall_of_fame()
	$Panel.visible = false
	$".".add_child(high_score_instance)
