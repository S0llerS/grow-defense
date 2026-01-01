extends Node

# round stats
var score : int = 0
var money : int = 1000
var food : int = 0

var enemies_killed : int = 0

var total_wave_enemies: int = 0
var current_wave_enemies: int = 0

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
	# stats
	score = 0
	money = 10000
	food = 0
	
	enemies_killed = 0
	
	wave = 1
	
	round_time = 0.0
	
	# emit signals
	score_changed.emit()
	money_changed.emit()
	food_changed.emit()

	wave_changed.emit()

# stats
func change_score(amount: int) -> void:
	score += amount
	score_changed.emit()

func change_money(amount: int) -> bool:
	if money + amount < 0:
		return false
	
	money += amount
	money_changed.emit()
	
	return true

func change_food(amount: int) -> void:
	food += amount
	food_changed.emit()

# wave
func next_wave() -> void:
	wave += 1
	wave_changed.emit()
