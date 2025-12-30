class_name ShootComponent
extends Node2D

@export var projectile : PackedScene

@onready var timer: Timer = $Timer

var can_shoot : bool = true

func shoot(target: Node2D):
	if can_shoot:
		var instance : Projectile = projectile.instantiate()
		
		instance.target = target
		
		get_parent().get_parent().add_child(instance)
		instance.global_position = global_position
		
		can_shoot = false
		timer.start()

func _on_timer_timeout() -> void:
	can_shoot = true
