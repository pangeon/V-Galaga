extends Control

@onready var score = $Score

@onready var life_icons = [$LivesIcon_1, $LivesIcon_2, $LivesIcon_3]

func update_score_ui(new_score: int):
	score.text = "SCORE: " + str(new_score)

func off_visible_left_lives(score_amount: int):
	if score_amount == 2:
		life_icons[2].visible = false
	elif score_amount == 1:
		life_icons[2].visible = false
		life_icons[1].visible = false
	elif score_amount == 0:
		for i in range(0, 2):
			life_icons[i].visible = false
	else:
		pass

