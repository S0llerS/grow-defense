class_name GridManager
extends Node2D

@export var ui : UI

@export var plant : PackedScene
@export var grid_cell : PackedScene

var cell_size : Vector2 = Vector2(64, 64)
var grid_size : Vector2 = Vector2(64, 36)

func _ready() -> void:
	init()

func init() -> void:
	var width = grid_size.x * cell_size.x
	var height = grid_size.y * cell_size.y
	
	for x in grid_size.x:
		for y in grid_size.y:
			# calculate position
			var pos: Vector2 = Vector2(
				-width / 2 + cell_size.x * x + cell_size.x / 2,
				-height / 2 + cell_size.y * y + cell_size.y / 2
			)
			
			# add grid cell
			var cell: GridCell = grid_cell.instantiate()
			
			cell.position = pos
			add_child(cell)
			
			# setup signal
			cell.select_component.place.connect(func():
				var selected_pc: PlantCell = ui.plants_container.selected_pc
				if !cell.plant and selected_pc:
					var plant_instance: Plant = selected_pc.plant_scene.instantiate()
					
					var price = plant_instance.plant_stats.price
					if !Stats.change_money(-price):
						plant_instance.queue_free()
						return
					
					cell.add_child(plant_instance)
					cell.plant = plant_instance
			)
			cell.select_component.delete.connect(func():
				var selected_pc: PlantCell = ui.plants_container.selected_pc
				if selected_pc:
					ui.plants_container.deselect_pc()
				elif cell.plant:
					cell.plant.queue_free()
			)
