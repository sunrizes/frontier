extends Node3D
class_name Tile

@export var resource: Util.RESOURCE = Util.RESOURCE.DESERT
@export var number: int = -1

#Visuals
@export var tile_mesh: MeshInstance3D
@export var number_visual: Label3D

func setup(resource_type: Util.RESOURCE, tile_number: int) -> void:
	resource = resource_type
	number = tile_number
	update_visual()
	
func update_visual() -> void:
	match resource:
		Util.RESOURCE.BRICK:
			tile_mesh.material_override = Util.tile_material_brick
		Util.RESOURCE.DESERT:
			tile_mesh.material_override = Util.tile_material_desert
		Util.RESOURCE.GRAIN:
			tile_mesh.material_override = Util.tile_material_grain
		Util.RESOURCE.LUMBER:
			tile_mesh.material_override = Util.tile_material_lumber
		Util.RESOURCE.ORE:
			tile_mesh.material_override = Util.tile_material_ore
		Util.RESOURCE.WOOL:
			tile_mesh.material_override = Util.tile_material_wool
	
	number_visual.text = str(number)
