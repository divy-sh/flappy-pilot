extends Node2D

var fade_duration = 0.1

func _ready():
	var main_menu_button = $mainMenu
	main_menu_button.pressed.connect(_main_menu_button_pressed)
	var score_text = "[center]Score\n\n"
	var date = "[center]Date\n\n"
	for i in Global.save_data.high_score:
		score_text += str(i[0]) + "\n"
		date += str(i[1]) + "\n"
	$scores.text = score_text + "[/center]"
	$player_names.text = date + "[/center]"

func _process(_delta):
	if Global.game_state == Const.GameStates.HIGHSCORE:
		modulate.a = min(modulate.a + _delta / fade_duration, 1)
		visible = true
	else:
		modulate.a = max(modulate.a - _delta / fade_duration, 0)
		if modulate.a == 0:
			visible = false

func _main_menu_button_pressed():
	Global.main_menu()
