extends Control

const file_path = "res://high_score.dat"

var file_loader_scene = preload("res://scenes/file_loader.tscn")
var file_loader_instance = file_loader_scene.instantiate()
var file_content: PackedStringArray = file_loader_instance.load_file_content_as_array(file_path, "\n")

func refresh_hall_of_fame():	
	$Panel/FirstScoreLabel.text = file_content[0]
	$Panel/SecondScoreLabel.text = file_content[1]
	$Panel/ThirdScoreLabel.text = file_content[2]
	$Panel/FourthScoreLabel.text = file_content[3]
	$Panel/FivethScoreLabel.text = file_content[4]
	$Panel/SixthScoreLabel.text = file_content[5]

func save_score_to_hall_of_fame(total_score):	
	if int($Panel/FirstScoreLabel.text.substr(3)) < total_score:
		file_content[0] = "1. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return
	if int($Panel/SecondScoreLabel.text.substr(3)) < total_score:
		file_content[1] = "2. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return
	if int($Panel/ThirdScoreLabel.text.substr(3)) < total_score:
		file_content[2] = "3. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return
	if int($Panel/FourthScoreLabel.text.substr(3)) < total_score:
		file_content[3] = "4. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return
	if int($Panel/FivethScoreLabel.text.substr(3)) < total_score:
		file_content[4] = "5. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return
	if int($Panel/SixthScoreLabel.text.substr(3)) < total_score:
		file_content[5] = "6. " + str(total_score)
		file_loader_instance.save_file("\n".join(file_content), file_path)
		return

func _on_exit_button_pressed():
	get_tree().reload_current_scene()
