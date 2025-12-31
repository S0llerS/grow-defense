class_name Bomb
extends Enemy

func _on_attacked():
	health_component.take_damage(9999)
