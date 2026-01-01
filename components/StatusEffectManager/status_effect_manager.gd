class_name StatusEffectManager
extends Node2D

var handler

func _ready() -> void:
	handler = get_parent()

func apply_effect(effect: StatusEffect):
	for stat in effect.stats_multiplier:
		print(stat, effect.stats_multiplier[stat])
		
		if handler.stat:
			print("THERE IS: ", stat)
