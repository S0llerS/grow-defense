class_name Bomb
extends Enemy

func _on_destroyed():
	var result = damage_component.calculate_damage()
	attack_component.attack(result.total_damage)
	
	SoundPlayer.play_sound(SoundPlayer.EXPLOSION)
	
	super()

func _on_attacked():
	health_component.take_damage(9999)
