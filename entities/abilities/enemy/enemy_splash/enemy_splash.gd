class_name EnemySplash
extends CharacterBody2D

var damage: int

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Player or object is Plant:
		object.health_component.take_damage(damage)
