extends Node2D

var fade_duration = 0.1
var score
var restart_button
var main_menu_button
var gameOver

func _ready():
	gameOver = $GameOver
	score = $score
	restart_button = $restart
	main_menu_button = $mainMenu
	
	restart_button.pressed.connect(_restart_pressed)
	main_menu_button.pressed.connect(_menu_button_pressed)

func _restart_pressed():
	Global.game_idle()
	get_tree().reload_current_scene()

func _menu_button_pressed():
	Global.main_menu()
	get_tree().reload_current_scene()


func _process(_delta):
	if Global.game_state == Const.GameStates.OVER:
		if Global.is_high_score():
			gameOver.text = "[center]HIGH SCORE![center]"
		modulate.a = min(modulate.a + _delta / fade_duration, 1)
		visible = true
	else:
		modulate.a = max(modulate.a - _delta / fade_duration, 0)
		if modulate.a == 0:
			visible = false

	score.text = "[center]score: %s[center]" % Global.get_score()
