class_name Bomb
extends Enemy

func _on_destroyed():
	var result = damage_component.calculate_damage()
	attack_component.attack(result.total_damage)
	
	super()

func _on_attacked():
	health_component.take_damage(9999)
