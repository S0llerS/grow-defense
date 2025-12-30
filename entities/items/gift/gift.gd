class_name Gift
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Stats.change_score(100)
		
		queue_free()
