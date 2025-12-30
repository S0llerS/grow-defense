class_name Plant
extends StaticBody2D

@export var plant_stats : PlantStats

@onready var health_component: HealthComponent = $HealthComponent

@onready var range_component: RangeComponent = $RangeComponent
@onready var shoot_component: ShootComponent = $ShootComponent

var reach_range : float = 250.0

func _ready() -> void:
	range_component.scale = Vector2(reach_range, reach_range)

func _physics_process(_delta: float) -> void:
	var areas = range_component.get_overlapping_areas()
	for area in areas:
		if area.get_parent() is Enemy:
			shoot_component.shoot(area.get_parent())
