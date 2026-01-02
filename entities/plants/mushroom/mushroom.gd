class_name Mushroom
extends Plant

func _ready() -> void:
	super()
	
	shoot_component.SHOOT_SFX = SoundPlayer.MUSHROOM
