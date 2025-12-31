class_name  GameManager
extends Node2D

@export var player : Player

@export var enemy_scenes : Array[PackedScene]
var enemy_values : Array[int]

@onready var wave_timer: Timer = %WaveTimer

var total_wave_enemies: int = 0
var current_wave_enemies: int = 0

var enemies_left_to_spawn: int = 0
var enemy_scenes_to_spawn: Array[PackedScene] = []

var base_budget : int = 500
var growth_rate : float = 1.25

func _ready() -> void:
	calculate_values()
	start_wave()

func _process(delta: float) -> void:
	pass#print(Stats.current_wave_enemies)

func calculate_values() -> void:
	for enemy_scene in enemy_scenes:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy_values.append(enemy.enemy_stats.enemy_value)
		enemy.queue_free()

func add_entity(scene, pos):
	if !player:
		return
	
	var instance: Enemy = scene.instantiate()
	
	instance.target = player
	instance.position = pos
	
	add_child(instance)
	
	current_wave_enemies += 1
	
	instance.health_component.destroyed.connect(func():
		current_wave_enemies -= 1
		if current_wave_enemies == 0 and enemies_left_to_spawn == 0:
			print("END")
			end_wave()
	)

func get_random_position() -> Vector2:
	var angle = randf_range(0.0, TAU)
	var pos = Vector2(cos(angle), sin(angle)) * 300#0.0
	
	return pos

func distribute_budget(budget):
	while budget > 0:
		if budget == 1:
			enemy_scenes_to_spawn.append(enemy_scenes[0])
			enemies_left_to_spawn += 1
			break
		
		var enemy_scene = null
		var possible_values = enemy_values
		while !enemy_scene:
			var rnd_index = randi_range(0, enemy_values.size() - 1)
			var value = possible_values[rnd_index]
			if value <= budget:
				enemy_scene = enemy_scenes[rnd_index]
				budget -= value
			else:
				possible_values.remove_at(rnd_index)
		
		enemy_scenes_to_spawn.append(enemy_scene)
		enemies_left_to_spawn += 1

func start_wave():
	# get budget for the wave
	var wave_budget: int = int(base_budget * pow(growth_rate, Stats.wave))
	
	# distribute wave budget
	distribute_budget(wave_budget)
	
	# set final enemy count
	total_wave_enemies = enemies_left_to_spawn
	
	# spawn enemy with small delay between each other to avoid lag spike
	for enemy_scene in enemy_scenes_to_spawn:
		add_entity(enemy_scene, get_random_position())
		enemies_left_to_spawn -= 1
		
		await get_tree().create_timer(0.1).timeout

func end_wave():
	Stats.change_money(Stats.wave * 10)
	wave_timer.start()

func _on_wave_timer_timeout() -> void:
	if player:
		Stats.next_wave()
		start_wave()
