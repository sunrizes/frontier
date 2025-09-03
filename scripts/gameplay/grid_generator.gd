extends Node

@export var tile: PackedScene
@export var board_settings: BoardSettings
@export var hex_size: float = 1.0

var spawned_tiles: Array[Tile] = []

func _ready() -> void:
	var coordinates: Array[Vector2i] = generate_positions(board_settings.board_radius)

	var types: Array[Util.RESOURCE] = board_settings.tile_types.duplicate()
	types.shuffle()
	var numbers: Array[int] = board_settings.tile_numbers.duplicate()
	numbers.shuffle()

	var number_index: int = 0

	for i in range(coordinates.size()):
		var new_tile = tile.instantiate()
		var pos = tile_to_board(coordinates[i].x, coordinates[i].y, hex_size)
		new_tile.transform.origin = pos

		var res: Util.RESOURCE = types[i]
		var num: int = -1

		if res != Util.RESOURCE.DESERT:
			num = numbers[number_index]
			number_index += 1

		new_tile.setup(res, num)
		
		spawned_tiles.append(new_tile)

		add_child(new_tile)
	
	for i in range(spawned_tiles.size()):
		print(spawned_tiles[i].name)

func tile_to_board(q: int, r: int, size: float) -> Vector3:
	var x = size * sqrt(3) * (q + r/2.0)
	var z = size * 3.0/2.0 * r
	return Vector3(x, 0, z)

func generate_positions(radius: int) -> Array[Vector2i]:
	var coordinates: Array[Vector2i] = []
	for q in range(-radius, radius + 1):
		for r in range(-radius, radius + 1):
			var s = -q - r
			if (abs(s)) <= radius:
				coordinates.append(Vector2i(q, r))
	return coordinates
