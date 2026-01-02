class_name PlantCell
extends Button

@export var plant_scene : PackedScene
@export var tooltip_scene: PackedScene

@onready var outline: ColorRect = %Outline
@onready var plant_icon: TextureRect = %Icon

@onready var price: Label = %Price
@onready var id: Label = %Id

var plant_stats: PlantStats
var tooltip: Tooltip

func _ready() -> void:
	var plant: Plant = plant_scene.instantiate()
	
	plant_stats = plant.plant_stats
	plant.queue_free()

func _process(_delta: float) -> void:
	if tooltip:
		tooltip.global_position = get_global_mouse_position() + Vector2(8, -8)


func _on_mouse_entered() -> void:
	# tooltip
	tooltip = tooltip_scene.instantiate()
	add_child(tooltip)
	
	tooltip.title.text = plant_stats.title
	tooltip.plant_type.text = plant_stats.TYPE[plant_stats.type]
	tooltip.plant_type.modulate = plant_stats.COLOR[plant_stats.type]

func _on_mouse_exited() -> void:
	tooltip.queue_free()
	tooltip = null
