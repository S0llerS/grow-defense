class_name Lily
extends Plant

@export var aura_buff: StatusEffect

func _on_buff_area_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Plant:
		object.status_effect_manager.apply_effect(aura_buff)
