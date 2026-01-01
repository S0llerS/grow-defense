class_name AttackComponent
extends Node2D

@export var splash : PackedScene
@export var child_of_attacker : bool = true

@onready var timer: Timer = $Timer

var can_attack : bool = true

var effect: PackedScene

signal attacked

func attack(damage: int):
	if can_attack:
		var instance : Splash = splash.instantiate()
		
		instance.damage = damage
		if effect:
			instance.effect = effect
		
		if child_of_attacker:
			add_child(instance)
		else:
			instance.scale = scale * 2.0
			get_tree().root.add_child(instance) # attack_place.call_deferred("add_child", instance)
			instance.animator.speed_scale = 10.0
		instance.global_position = global_position
		
		# set what to attack
		var attacker = get_parent()
		if attacker is Enemy:
			instance.hitbox_component.set_collision_mask_value(2, true) # Player
			instance.hitbox_component.set_collision_mask_value(3, true) # Plant
		else:
			instance.hitbox_component.set_collision_mask_value(4, true) # Enemy
		
		# attack end
		can_attack = false
		attacked.emit()
		
		timer.start()

func _on_timer_timeout() -> void:
	can_attack = true
