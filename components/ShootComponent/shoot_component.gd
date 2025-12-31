class_name ShootComponent
extends Node2D

@export var projectile_scene : PackedScene

@onready var timer: Timer = $Timer

var can_shoot : bool = true

func shoot(damage: int, target: Node2D):
	if can_shoot:
		var projectile : Projectile = projectile_scene.instantiate()
		
		projectile.damage = damage
		projectile.target = target
		
		get_parent().get_parent().add_child(projectile)
		projectile.global_position = global_position
		
		can_shoot = false
		timer.start()

func _on_timer_timeout() -> void:
	can_shoot = true
