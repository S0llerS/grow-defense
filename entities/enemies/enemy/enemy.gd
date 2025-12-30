class_name Enemy
extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent

var speed : float = 100.0

var target : Node2D

func _ready() -> void:
	health_component.damaged.connect(_on_damaged)
	health_component.destroyed.connect(_on_destroyed)

func _on_damaged():
	pass

func _on_destroyed():
	Stats.change_score(100)
	Stats.change_money(25)
	
	queue_free()

func _physics_process(delta: float) -> void:
	if target:
		var direction = (target.global_position - global_position).normalized()
		velocity = lerp(velocity, direction * speed, 8.0 * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 8.0 * delta)
	
	move_and_slide()
