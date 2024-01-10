extends Control

const high_score_file_path: String = "user://high_score.dat"

const file_loader_scene = preload("res://scenes/file_loader.tscn")
var file_loader_instance = file_loader_scene.instantiate()
var high_score_file_content: PackedStringArray = file_loader_instance.load_file_content_as_array(high_score_file_path, "\n")

func refresh_hall_of_fame() -> void:	
	$Panel/FirstScoreLabel.text = high_score_file_content[0]
	$Panel/SecondScoreLabel.text = high_score_file_content[1]
	$Panel/ThirdScoreLabel.text = high_score_file_content[2]
	$Panel/FourthScoreLabel.text = high_score_file_content[3]
	$Panel/FivethScoreLabel.text = high_score_file_content[4]
	$Panel/SixthScoreLabel.text = high_score_file_content[5]

func save_score_to_hall_of_fame(total_score):
	var score_int_arr: PackedInt32Array = file_loader_instance.to_int(high_score_file_content)
	for i in range(0, 6):
		if score_int_arr[i] < total_score:
			update_hi_score_record(total_score, i, high_score_file_content, high_score_file_path)
			return
		
func update_hi_score_record(total_score: int, row_number: int, str_arr: PackedStringArray, path: String) -> void:
	str_arr[row_number] = str(row_number+1) + ". " + str(total_score)
	file_loader_instance.save_file("\n".join(str_arr), path)

func _on_exit_button_pressed() -> void:
	get_tree().reload_current_scene()
