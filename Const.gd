extends Node

enum GameStates {
	MENU,
	IDLE,
	PLAYING,
	OVER,
	HIGHSCORE,
	UNLOCK,
	UNLOCK_PLANES,
	UNLOCK_LEVELS,
}

var Levels = {
	desert = {
		name = "desert",
		unlocked = true,
		cost = 0,
		layerCount = 6
	},
	forest = {
		name = "forest",
		unlocked = false,
		cost = 500,
		layerCount = 7
	},
	skies = {
		name = "skies",
		unlocked = false,
		cost = 1000,
		layerCount = 9
	},
	moon = {
		name = "moon",
		unlocked = false,
		cost = 5000,
		layerCount = 6
	},
}

var Vehicles = {
	plane_1_blue = {
		name = "plane_1_blue",
		title = "Dingo Blue",
		unlocked = true,
		cost = 0
	},
	plane_1_pink = {
		name = "plane_1_pink",
		title = "Dingo Pink",
		unlocked = false,
		cost = 100
	},
	plane_1_red = {
		name = "plane_1_red",
		title = "Dingo Red",
		unlocked = false,
		cost = 200
	},
	plane_1_yellow = {
		name = "plane_1_yellow",
		title = "Dingo Yellow",
		unlocked = false,
		cost = 500
	},
	plane_2_blue = {
		name = "plane_2_blue",
		title = "Audit Blue",
		unlocked = false,
		cost = 800
	},
	plane_2_green = {
		name = "plane_2_green",
		title = "Audit Green",
		unlocked = false,
		cost = 1000
	},
	plane_2_red = {
		name = "plane_2_red",
		title = "Audit Red",
		unlocked = false,
		cost = 1500
	},
	plane_2_yellow = {
		name = "plane_2_yellow",
		title = "Audit yellow",
		unlocked = false,
		cost = 2000
	},
	plane_3_blue = {
		name = "plane_3_blue",
		title = "Calibri Blue",
		unlocked = false,
		cost = 2500
	},
	plane_3_green = {
		name = "plane_3_green",
		title = "Calibri Green",
		unlocked = false,
		cost = 3000
	},
	plane_3_red = {
		name = "plane_3_red",
		title = "Calibri Red",
		unlocked = false,
		cost = 4000
	},
	plane_3_yellow = {
		name = "plane_3_yellow",
		title = "Calibri Yellow",
		unlocked = false,
		cost = 8000
	},
}

var default_save_data = {
	"high_score" = [],
	"coins" = 0,
	"level" = Levels.desert,
	"vehicle" = Vehicles.plane_1_blue,
	"levels" = Levels,
	"vehicles" = Vehicles,
	"score_multiplier" = 1,
	"coin_multiplier" = 1,
	"version" = 1
}
