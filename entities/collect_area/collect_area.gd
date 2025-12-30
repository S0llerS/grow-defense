class_name CollectArea
extends Area2D

var collected : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if Stats.gifts > 0:
			Stats.change_score(500)
			Stats.remove_gift()
			
			queue_free()
