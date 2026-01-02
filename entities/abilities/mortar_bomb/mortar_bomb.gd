class_name MortarBomb
extends CharacterBody2D

@onready var attack_component: AttackComponent = $AttackComponent

var speed: float
var damage: int

var target_position: Vector2

func _ready() -> void:
	attack_component.scale = scale * 2

func _physics_process(delta: float) -> void:
	if target_position:
		var direction = (target_position - global_position).normalized()
		velocity = direction * speed
	
	move_and_slide()
	
	# clean up projectiles
	if velocity.length() < 10.0:
		queue_free()
	if abs(global_position.x) > 2148 or abs(global_position.y) > 1252:
		queue_free()


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	#var object = area.get_parent()
	#if object is Enemy:
		#PopupManager.spawn_damage_popup(global_position, damage)
		#object.health_component.take_damage(damage)
	
	attack_component.attack(250)
	queue_free()
