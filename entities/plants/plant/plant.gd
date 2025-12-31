class_name Plant
extends StaticBody2D

@export var plant_stats : PlantStats

@onready var health_component: HealthComponent = $HealthComponent
@onready var damage_component: DamageComponent = $DamageComponent

@onready var range_component: RangeComponent = $RangeComponent
@onready var shoot_component: ShootComponent = $ShootComponent

func _ready() -> void:
	# setup
	health_component.max_health = plant_stats.health
	health_component.health = plant_stats.health
	
	damage_component.damage = plant_stats.damage
	damage_component.crit_multiplier = plant_stats.crit_multiplier
	damage_component.crit_chance = plant_stats.crit_chance
	
	if range_component:
		range_component.scale = Vector2(plant_stats.attack_range, plant_stats.attack_range)
	if shoot_component:
		shoot_component.timer.wait_time = plant_stats.attack_speed
	
	# signals
	health_component.damaged.connect(_on_damaged)
	health_component.destroyed.connect(_on_destroyed)

func _on_damaged():
	pass

func _on_destroyed():
	queue_free()

func _physics_process(_delta: float) -> void:
	if !range_component or !shoot_component:
		return
	
	var areas = range_component.get_overlapping_areas()
	for area in areas:
		if area.get_parent() is Enemy:
			var result = damage_component.calculate_damage()
			shoot_component.shoot(result.total_damage, area.get_parent())
