class_name Splash
extends CharacterBody2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var animator: AnimationPlayer = %Animator

var damage: int
var effect: PackedScene

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	PopupManager.spawn_damage_popup(object.global_position, damage)
	object.health_component.take_damage(damage)
	if effect:
		var instance = effect.instantiate()
		object.add_child(instance)
