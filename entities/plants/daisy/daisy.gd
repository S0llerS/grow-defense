class_name Daisy
extends Plant

@export var freeze_effect: PackedScene

@onready var attack_component: AttackComponent = $AttackComponent

func _ready() -> void:
	super()
	
	attack_component.scale = Vector2(plant_stats.shoot_range, plant_stats.shoot_range)
	attack_component.effect = freeze_effect

func _physics_process(_delta: float) -> void:
	attack_component.attack(plant_stats.damage)
