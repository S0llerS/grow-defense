class_name Sunflower
extends Plant

func _ready() -> void:
	super()
	
	shoot_component.SHOOT_SFX = SoundPlayer.SUNFLOWER
