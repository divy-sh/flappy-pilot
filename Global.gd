extends Node

var save_data = {}
var SPEED = -500
var score = 0
var coins = 0
var game_state = Const.GameStates.MENU
var base_cost = 10

func save():
	save_data.coins += get_coins()
	if is_high_score():
		save_data.high_score.append([get_score(), Time.get_date_string_from_system()])
		save_data.high_score.sort()
		save_data.high_score.reverse()
	if len(save_data.high_score) > 10:
		save_data.high_score.pop_back()

	var save_file = FileAccess.open("user://save.cfg", FileAccess.WRITE)
	save_file.store_var(save_data)
	save_file.close()

func is_high_score():
	return (
		get_score() > 0 and 
		(
			len(save_data.high_score) < 10 or 
			get_score() > save_data.high_score[-1][0]
		)
	)

func load():
	if not FileAccess.file_exists("user://save.cfg"):
		save_data = Const.default_save_data
		save()

	var file = FileAccess.open("user://save.cfg", FileAccess.READ)
	var data = file.get_var()
	save_data = Const.default_save_data
	for key in data:
		if key == "levels" or key == "vehicles":
			continue

		save_data[key] = data[key]

func game_over():
	save()
	coins = 0
	SPEED = 0
	game_state = Const.GameStates.OVER

func game_idle():
	SPEED = -500
	game_state = Const.GameStates.IDLE

func main_menu():
	SPEED = -500
	game_state = Const.GameStates.MENU

func high_score():
	SPEED = 0
	game_state = Const.GameStates.HIGHSCORE

func unlocks():
	SPEED = 0
	game_state = Const.GameStates.UNLOCK

func unlock_planes():
	SPEED = 0
	game_state = Const.GameStates.UNLOCK_PLANES

func unlock_levels():
	SPEED = 0
	game_state = Const.GameStates.UNLOCK_LEVELS

func game_playing():
	game_state = Const.GameStates.PLAYING

func get_coin_multiplier_cost():
	return snapped(pow(save_data.coin_multiplier, 2) * base_cost, 0)

func get_score_multiplier_cost():
	return snapped(pow(save_data.score_multiplier, 2) * base_cost, 0)

func increment_coin_multiplier():
	save_data.coin_multiplier += 1

func increment_score_multiplier():
	save_data.score_multiplier += 1

func get_score():
	return score * save_data.score_multiplier

func get_coins():
	return coins * save_data.coin_multiplier
