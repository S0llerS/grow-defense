class_name  GameManager
extends Node2D

@export var player : Player

@export var enemy_scene : PackedScene

@onready var wave_timer: Timer = %WaveTimer

func _ready() -> void:
	start_wave()

func add_entity(scene, pos):
	var instance = scene.instantiate()
	
	if instance is Enemy:
		instance.target = player
		get_parent().call_deferred("add_child", instance)
	else:
		add_child(instance)
	
	instance.global_position = pos

func get_random_position() -> Vector2:
	var angle = randf_range(0.0, TAU)
	var pos = Vector2(cos(angle), sin(angle)) * 300#0.0
	
	return pos

func start_wave():
	for i in range(10):
		add_entity(enemy_scene, get_random_position())


func _on_wave_timer_timeout() -> void:
	Stats.next_wave()
	start_wave()
