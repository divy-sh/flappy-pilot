extends Node2D

func _ready():
	var level = load("res://level/level.tscn")
	var level_inst = level.instantiate()
	level_inst.position = Vector2(0, 0)
	level_inst.scale = Vector2(1.2, 1.2) # Set scale to 2x
	add_child(level_inst)

func _process(_delta):
	pass
