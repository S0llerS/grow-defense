class_name UI
extends CanvasLayer

@export var player: Player
@export var game_manager: GameManager

@onready var score: Label = %Score
@onready var money: Label = %Money
@onready var food: Label = %Food

@onready var wave: Label = %Wave
@onready var wave_progress: ColorRect = %WaveProgress

@onready var plants_container: PlantsContainer = %PlantsContainer
@onready var end_screen: EndScreen = %EndScreen

@onready var animator: AnimationPlayer = $Animator

func _ready() -> void:
	Stats.score_changed.connect(_on_score_changed)
	Stats.money_changed.connect(_on_money_changed)
	Stats.food_changed.connect(_on_food_changed)
	
	Stats.wave_changed.connect(_on_wave_changed)
	
	player.health_component.destroyed.connect(_on_destroyed)
	
	game_manager.total_we_changed.connect(_on_total_we_changed)
	game_manager.current_we_changed.connect(_on_current_we_changed)

func _process(delta: float) -> void:
	var target_scale = float(game_manager.current_wave_enemies) / game_manager.total_wave_enemies
	
	wave_progress.scale.x = lerp(wave_progress.scale.x, target_scale, 8.0 * delta)

func _on_score_changed():
	score.text = "Score: " + str(Stats.score)

func _on_money_changed():
	money.text = str(Stats.money)

func _on_food_changed():
	food.text = "Food: " + str(Stats.food)

func _on_wave_changed():
	wave.text = "WAVE " + str(Stats.wave)
	animator.play("wave")

func _on_destroyed():
	MusicPlayer.stop_music()
	end_screen.toggle()

func _on_total_we_changed():
	pass

func _on_current_we_changed():
	pass

# settings
func _on_settings_pressed() -> void:
	Settings.toggle()
