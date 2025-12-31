class_name AttackComponent
extends Node2D

@export var splash : PackedScene

@onready var timer: Timer = $Timer

var can_attack : bool = true

signal attacked

func attack(damage: int):
	if can_attack:
		var instance : EnemySplash = splash.instantiate()
		
		instance.damage = damage
		
		add_child(instance)
		instance.global_position = global_position
		
		can_attack = false
		attacked.emit()
		
		timer.start()

func _on_timer_timeout() -> void:
	can_attack = true
