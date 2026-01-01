class_name EnemySplash
extends CharacterBody2D

@onready var animator: AnimationPlayer = %Animator

var damage: int

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Player or object is Plant:
		PopupManager.spawn_damage_popup(global_position, damage)
		object.health_component.take_damage(damage)
