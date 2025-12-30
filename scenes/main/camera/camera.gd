class_name Camera
extends Camera2D

@export var player : Player

func _physics_process(delta: float) -> void:
	pass
	
	if player:
		var pos_offset = player.velocity * 0.5
		global_position = lerp(global_position, player.global_position + pos_offset, 12.0 * delta)
