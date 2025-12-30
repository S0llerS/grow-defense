class_name PlantsContainer
extends Control

@onready var container: VBoxContainer = %Container
@onready var toggle_icon: TextureRect = %Icon

@onready var grid_container: GridContainer = %GridContainer

var selected_pc : PlantCell
var plant_visuals : Plant

var is_open : bool = true

func _ready() -> void:
	var plant_cells = grid_container.get_children()
	var id = 1
	for plant_cell in plant_cells:
		if plant_cell is PlantCell:
			# setup
			plant_cell.id.text = str(id)
			id += 1
			
			# signal
			plant_cell.pressed.connect(func():
				select_pc(plant_cell)
			)

func _input(event: InputEvent) -> void:
	# handle keyboard
	if event is InputEventKey and event.pressed and is_open:
		# currently there are 6 plant cells in the grid container
		for i in range(6):
			if event.keycode == KEY_1 + i:
				var pc = grid_container.get_child(i)
				select_pc(pc)

func _physics_process(_delta: float) -> void:
	if selected_pc:
		if plant_visuals:
			plant_visuals.global_position = get_global_mouse_position()

func select_pc(pc: PlantCell) -> void:
	if pc == selected_pc:
		pc.outline.visible = false
		selected_pc = null
		
		if plant_visuals:
			plant_visuals.queue_free()
		
		return
	
	if selected_pc:
		selected_pc.outline.visible = false
		if plant_visuals:
			plant_visuals.queue_free()
	
	pc.outline.visible = true
	selected_pc = pc
	
	plant_visuals = pc.plant_scene.instantiate()
	plant_visuals.global_position = get_global_mouse_position()
	add_child(plant_visuals)

func deselect_pc() -> void:
	if selected_pc:
		selected_pc.outline.visible = false
		selected_pc = null
		
		if plant_visuals:
			plant_visuals.queue_free()

func _on_toggle_pressed() -> void:
	if is_open:
		var tween = get_tree().create_tween()
		tween.set_parallel()
		
		tween.tween_property(container, "position", Vector2(0, 180), 0.4).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(toggle_icon, "rotation", deg_to_rad(0), 0.3).set_trans(Tween.TRANS_CUBIC)
		
		deselect_pc()
		
		is_open = false
	else:
		var tween = get_tree().create_tween()
		tween.set_parallel()
		
		tween.tween_property(container, "position", Vector2.ZERO, 0.4).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(toggle_icon, "rotation", deg_to_rad(180), 0.3).set_trans(Tween.TRANS_CUBIC)
		
		is_open = true
