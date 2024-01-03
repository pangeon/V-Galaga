extends Control

func save_score_to_hall_of_fame(total_score):
	if int($Panel/FirstScoreLabel.text.substr(2)) < total_score:
		$Panel/FirstScoreLabel.text = "1. " + str(total_score)
		return 
	if int($Panel/SecondScoreLabel.text.substr(2)) < total_score:
		$Panel/SecondScoreLabel.text = "2. " + str(total_score)
		return
	if int($Panel/ThirdScoreLabel.text.substr(2)) < total_score:
		$Panel/ThirdScoreLabel.text = "3. " + str(total_score)
		return
	if int($Panel/FourthScoreLabel.text.substr(2)) < total_score:
		$Panel/FourthScoreLabel.text = "4. " + str(total_score)
		return
	if int($Panel/FivethScoreLabel.text.substr(2)) < total_score:
		$Panel/FivethScoreLabel.text = "5. " + str(total_score)
		return
	if int($Panel/SixthScoreLabel.text.substr(2)) < total_score:
		$Panel/SixthScoreLabel.text = "6. " + str(total_score)
		return

func _on_exit_button_pressed():
	get_tree().reload_current_scene()
