class_name PlantCell
extends Button

@export var plant_scene : PackedScene

@onready var outline: ColorRect = %Outline
@onready var plant_icon: TextureRect = %Icon

@onready var price: Label = %Price
@onready var id: Label = %Id
