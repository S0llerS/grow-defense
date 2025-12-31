class_name Splash
extends CharacterBody2D


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Enemy:
		object.health_component.take_damage(5)
