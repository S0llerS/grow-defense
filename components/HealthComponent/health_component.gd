class_name HealthComponent
extends Node2D

@export var max_health : int = 10
var health : int

var is_destroyed: bool = false

signal damaged
signal destroyed

func _ready() -> void:
	health = max_health

func take_damage(amount: int):
	if is_destroyed:
		return
	
	health -= amount
	if health <= 0:
		is_destroyed = true
		destroyed.emit()
	else:
		damaged.emit()
