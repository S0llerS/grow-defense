class_name Splash
extends CharacterBody2D


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if get_parent() is Enemy:
		if object is Player or object is Plant:
			object.health_component.take_damage(5)
	else:
		if object is Enemy:
			object.health_component.take_damage(5)
