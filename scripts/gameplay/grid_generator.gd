extends Node

@export var tile: PackedScene
@export var board_settings: BoardSettings

func _ready() -> void:
	populate_board(board_settings.board_layout)

func populate_board(tile_positions: Array[Vector3]) -> void:
	for pos in tile_positions:
		var new_tile = tile.instantiate()
		new_tile.position = pos
		add_child(new_tile)
