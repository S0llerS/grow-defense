class_name AttackComponent
extends Node2D

@export var splash : PackedScene
@export var child_of_attacker : bool = true

@onready var timer: Timer = $Timer

var can_attack : bool = true

signal attacked

func attack(damage: int):
	if can_attack:
		var instance : EnemySplash = splash.instantiate()
		
		instance.damage = damage
		
		if child_of_attacker:
			add_child(instance)
		else:
			instance.scale = scale * 2.0
			get_parent().get_parent().add_child(instance)
			instance.animator.speed_scale = 10.0
		instance.global_position = global_position
		
		can_attack = false
		attacked.emit()
		
		timer.start()

func _on_timer_timeout() -> void:
	can_attack = true
