class_name AttackComponent
extends Node2D

@export var splash : PackedScene

@onready var timer: Timer = $Timer

var can_attack : bool = true

func attack():
	if can_attack:
		var instance : Splash = splash.instantiate()
		
		add_child(instance)
		instance.global_position = global_position
		
		can_attack = false
		timer.start()

func _on_timer_timeout() -> void:
	can_attack = true
