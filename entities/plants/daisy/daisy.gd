class_name Daisy
extends Plant

@export var freeze_effect: PackedScene

@onready var attack_component: AttackComponent = $AttackComponent

var freeze_range: float = 180.0

func _ready() -> void:
	super()
	
	attack_component.scale = Vector2(freeze_range, freeze_range)
	attack_component.effect = freeze_effect

func _physics_process(_delta: float) -> void:
	attack_component.attack(1)
