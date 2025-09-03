extends Node

#region Tile Materials
@export var tile_material_brick: StandardMaterial3D
@export var tile_material_desert: StandardMaterial3D
@export var tile_material_grain: StandardMaterial3D
@export var tile_material_lumber: StandardMaterial3D
@export var tile_material_ore: StandardMaterial3D
@export var tile_material_wool: StandardMaterial3D
#endregion

func _ready() -> void:
	tile_material_brick = preload("res://assets/materials/tile_material_brick.tres")
	tile_material_desert = preload("res://assets/materials/tile_material_desert.tres")
	tile_material_grain = preload("res://assets/materials/tile_material_grain.tres")
	tile_material_lumber = preload("res://assets/materials/tile_material_lumber.tres")
	tile_material_ore = preload("res://assets/materials/tile_material_ore.tres")
	tile_material_wool = preload("res://assets/materials/tile_material_wool.tres")

enum RESOURCE {
	GRAIN,
	LUMBER,
	WOOL,
	ORE,
	BRICK,
	DESERT
}
