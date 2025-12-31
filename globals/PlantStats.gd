class_name PlantStats
extends Resource

@export var title : String = "Plant"
@export var price : int = 100

enum PlantType { SHOOTER, SPLASH, TANK, SUPPORT, MORTAR }
@export var type : PlantType = PlantType.SHOOTER

@export var health : int = 10

@export var damage : int = 5

@export var crit_multiplier : float = 2.5
@export var crit_chance : float = 10.0

@export var attack_range : float = 250.0
@export var attack_speed : float = 0.8
