class_name ShootComponent
extends Node2D

@export var projectile_scene : PackedScene
@export var mortar_bomb_scene : PackedScene

@onready var timer: Timer = $Timer

var shoot_speed: float

var projectile_speed: float
var projectile_size: float

var projectile_slows_down: bool
var can_pierce: bool

var spread: float
var n_projectiles: int
var n_projectile_burst: int

var plant_stats: PlantStats

var can_shoot : bool = true

var SHOOT_SFX

func setup(stats: Dictionary) -> void:
	shoot_speed = stats.shoot_speed
	
	timer.wait_time = shoot_speed

func shoot(damage: int, target: Node2D):
	if can_shoot:
		can_shoot = false
		
		var projectile_direction = (target.global_position - global_position).normalized()
		for i in range(n_projectiles):
			for j in range(n_projectile_burst):
				if projectile_scene:
					if SHOOT_SFX:
						SoundPlayer.play_sound(SHOOT_SFX)
					spawn_projectile(damage, projectile_direction)
				if mortar_bomb_scene:
					SoundPlayer.play_sound(SoundPlayer.MORTAR)
					spawn_mortar_bomb(damage, target.global_position)
				
				var delay = shoot_speed / n_projectile_burst * 0.75
				await get_tree().create_timer(delay).timeout
		
		timer.start()

func spawn_projectile(damage: int, direction: Vector2):
	var projectile : Projectile = projectile_scene.instantiate()
	
	projectile.speed = projectile_speed
	projectile.slows_down = projectile_slows_down
	
	projectile.scale = Vector2(projectile_size, projectile_size)
	
	projectile.damage = damage
	projectile.can_pierce = can_pierce
	
	var rng_spread = randf_range(-spread, spread)
	direction = direction.rotated(deg_to_rad(rng_spread))
	
	projectile.direction = direction
	projectile.velocity = direction * projectile.speed
	#projectile.target = target
	
	get_parent().get_parent().add_child(projectile)
	projectile.global_position = global_position

func spawn_mortar_bomb(damage: int, target_position: Vector2):
	var mortar_bomb : MortarBomb = mortar_bomb_scene.instantiate()
	
	mortar_bomb.scale = Vector2(projectile_size, projectile_size)
	
	mortar_bomb.speed = projectile_speed
	mortar_bomb.damage = damage
	
	mortar_bomb.target_position = target_position
	
	get_parent().get_parent().add_child(mortar_bomb)
	mortar_bomb.global_position = global_position

func _on_timer_timeout() -> void:
	can_shoot = true
