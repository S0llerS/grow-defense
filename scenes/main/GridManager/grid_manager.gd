class_name GridManager
extends Node2D

@export var ui : UI

@export var plant : PackedScene
@export var grid_cell : PackedScene

var cell_size : Vector2 = Vector2(64, 64)
var grid_size : Vector2 = Vector2(64, 36)

var selected_plant_cell_visuals

func _ready() -> void:
	init()
	
	# signals

func init() -> void:
	var width = grid_size.x * cell_size.x
	var height = grid_size.y * cell_size.y
	
	for x in grid_size.x:
		for y in grid_size.y:
			if randf_range(0, 100) < 75:
				continue
			
			var pos: Vector2 = Vector2(
				-width / 2 + cell_size.x * x + cell_size.x / 2,
				-height / 2 + cell_size.y * y + cell_size.y / 2
			)
			
			var instance: Plant = plant.instantiate()
			instance.position = pos
			add_child(instance)
			
			#var grid_cell = GridCell.new()
			#grid_cell.plant = instance
			
			instance.select_component.selected.connect(func():
				instance.queue_free()
			)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			if ui.plants_container.selected_pc:
				var diff = Vector2(
					get_global_mouse_position().x / cell_size.x,
					get_global_mouse_position().y / cell_size.y
				)
				var pos = Vector2(
					int(diff.x) * cell_size.x + cell_size.x / 2,
					int(diff.y) * cell_size.y - cell_size.y / 2
				)
				var instance: Plant = plant.instantiate()
				
				add_child(instance)
				instance.position = pos
				
				instance.select_component.selected.connect(func():
					instance.queue_free()
				)

func _physics_process(_delta: float) -> void:
	pass
