class_name Projectile
extends CharacterBody2D

var speed : float = 450.0

var damage : int

var direction : Vector2
var target : Node2D

func _physics_process(_delta: float) -> void:
	if target:
		direction = (target.global_position - global_position).normalized()
		velocity = direction * speed
	
	move_and_slide()
	
	# clean up projectiles
	if velocity.length() < speed / 2:
		queue_free()
	if abs(global_position.x) > 2148 or abs(global_position.y) > 1252:
		queue_free()


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Enemy:
		PopupManager.spawn_damage_popup(global_position, damage)
		object.health_component.take_damage(damage)
	
	queue_free()
