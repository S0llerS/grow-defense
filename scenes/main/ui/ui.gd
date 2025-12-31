class_name UI
extends CanvasLayer

@export var game_manager: GameManager

@onready var score: Label = %Score
@onready var money: Label = %Money
@onready var food: Label = %Food

@onready var wave: Label = %Wave
@onready var wave_progress: ColorRect = %WaveProgress

@onready var plants_container: PlantsContainer = %PlantsContainer

func _ready() -> void:
	Stats.score_changed.connect(_on_score_changed)
	Stats.money_changed.connect(_on_money_changed)
	Stats.food_changed.connect(_on_food_changed)
	
	Stats.wave_changed.connect(_on_wave_changed)
	
	#Stats.total_wave_enemies_changed.connect(_on_total_wave_enemies_changed)
	#Stats.current_wave_enemies_changed.connect(_on_current_wave_enemies_changed)

func _process(delta: float) -> void:
	wave_progress.scale.x = float(game_manager.current_wave_enemies) / game_manager.total_wave_enemies
	print("////")
	print(game_manager.total_wave_enemies, " ", game_manager.current_wave_enemies)
	print(wave_progress.scale.x)

func _on_score_changed():
	score.text = "Score: " + str(Stats.score)

func _on_money_changed():
	money.text = "Money: $" + str(Stats.money)

func _on_food_changed():
	food.text = "Food: " + str(Stats.food)

func _on_wave_changed():
	wave.text = "WAVE " + str(Stats.wave)

func _on_total_wave_enemies_changed():
	pass

func _on_current_wave_enemies_changed():
	pass#wave_progress.scale.x = float(Stats.total_wave_enemies) / float(Stats.current_wave_enemies)
	

# settings
func _on_settings_pressed() -> void:
	Settings.toggle()
