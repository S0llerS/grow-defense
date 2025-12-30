extends Node

# round stats
var score : int = 0
var money : int = 100
var food : int = 0

var enemies_killed : int = 0

var wave : int = 1
var round_time : float = 0.0

# all time stats
var total_score : int = 0
var total_money : int = 0
var total_food : int = 0

var total_enemies_killed : int = 0

var total_waves : int = 0
var total_time : float = 0.0

# signals
signal score_changed
signal money_changed
signal food_changed

signal wave_changed

# reset all of the statistics
func reset() -> void:
	score = 0
	money = 100
	
	wave = 1
	
	round_time = 0.0

# stats
func change_score(amount: int) -> void:
	score += amount
	score_changed.emit()

func change_money(amount: int) -> void:
	money += amount
	money_changed.emit()

func change_food(amount: int) -> void:
	food += amount
	food_changed.emit()

# wave
func next_wave() -> void:
	wave += 1
	wave_changed.emit()
