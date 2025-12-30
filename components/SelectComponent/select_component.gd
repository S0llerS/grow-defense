class_name SelectComponent
extends Area2D

signal selected

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 2 and event.pressed:
			selected.emit()
