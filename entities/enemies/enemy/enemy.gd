class_name Enemy
extends CharacterBody2D

@export var enemy_stats : EnemyStats

@onready var health_component: HealthComponent = $HealthComponent

@onready var range_component: RangeComponent = $RangeComponent
@onready var attack_component: AttackComponent = $AttackComponent

var target : Node2D

func _ready() -> void:
	range_component.scale = Vector2(enemy_stats.attack_range, enemy_stats.attack_range)
	attack_component.scale = Vector2(enemy_stats.attack_range, enemy_stats.attack_range)
	
	health_component.damaged.connect(_on_damaged)
	health_component.destroyed.connect(_on_destroyed)

func _on_damaged():
	pass

func _on_destroyed():
	Stats.change_score(enemy_stats.score_value)
	Stats.change_money(enemy_stats.money_value)
	
	queue_free()

func _physics_process(delta: float) -> void:
	# attack
	var areas = range_component.get_overlapping_areas()
	for area in areas:
		var object = area.get_parent()
		if object is Player or object is Plant:
			attack_component.attack()
	
	# movement
	if target:
		var direction = (target.global_position - global_position).normalized()
		velocity = lerp(velocity, direction * enemy_stats.speed, 8.0 * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 8.0 * delta)
	
	move_and_slide()
