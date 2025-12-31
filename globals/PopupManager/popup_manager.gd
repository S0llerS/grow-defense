extends Node2D

@export var damage_popup : PackedScene

func spawn_damage_popup(spawn_position: Vector2, damage_amount: int):
	var popup: DamagePopup = damage_popup.instantiate()
	
	get_tree().root.add_child(popup)
	popup.global_position = spawn_position
	popup.setup(damage_amount)
