class_name UI
extends CanvasLayer

@onready var score: Label = %Score
@onready var money: Label = %Money
@onready var food: Label = %Food

@onready var wave: Label = %Wave

@onready var plants_container: PlantsContainer = %PlantsContainer

func _ready() -> void:
	Stats.score_changed.connect(_on_score_changed)
	Stats.money_changed.connect(_on_money_changed)
	Stats.food_changed.connect(_on_food_changed)
	
	Stats.wave_changed.connect(_on_wave_changed)

func _on_score_changed():
	score.text = "Score: " + str(Stats.score)

func _on_money_changed():
	money.text = "Money: $" + str(Stats.money)

func _on_food_changed():
	food.text = "Food: " + str(Stats.food)

func _on_wave_changed():
	wave.text = "WAVE " + str(Stats.wave)

# settings
func _on_settings_pressed() -> void:
	Settings.toggle()
