extends Node2D

var coin_multiplier_button
var score_multiplier_button

func _ready():
	coin_multiplier_button = $coin_multiplier
	score_multiplier_button = $score_multiplier
	
	coin_multiplier_button.pressed.connect(_coin_multiplier_pressed)
	score_multiplier_button.pressed.connect(_score_multiplier_pressed)

func _process(_delta):
	coin_multiplier_button.text = "coin\nx%s\n\n%s" % [Global.save_data["coin_multiplier"], Global.get_coin_multiplier_cost()]
	score_multiplier_button.text = "score\nx%s\n\n%s" % [Global.save_data["score_multiplier"], Global.get_score_multiplier_cost()]

func _coin_multiplier_pressed():
	var cost = Global.get_coin_multiplier_cost()
	if Global.save_data["coins"] >= cost:
		Global.save_data["coins"] = Global.save_data["coins"] - cost
		Global.increment_coin_multiplier()	
		Global.save()

func _score_multiplier_pressed():
	var cost = Global.get_score_multiplier_cost()
	if Global.save_data.coins >= cost:
		Global.save_data.coins = Global.save_data["coins"] - cost
		Global.increment_score_multiplier()
	
		Global.save()
