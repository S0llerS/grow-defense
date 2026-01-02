class_name Lily
extends Plant

@export var aura_buff: StatusEffect

func _on_buff_area_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Plant:
		if object is Lily:
			return
		
		object.status_effect_manager.apply_effect(aura_buff)


func _on_buff_area_area_exited(area: Area2D) -> void:
	var object = area.get_parent()
	if object is Plant:
		if object is Lily:
			return
		
		object.status_effect_manager.remove_effect(aura_buff)
