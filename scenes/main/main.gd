class_name Main
extends Node2D

func _ready() -> void:
	Stats.reset()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("restart") and !DiamondTransition.is_transitioning:
		DiamondTransition.transition_to(Scenes.MAIN)
