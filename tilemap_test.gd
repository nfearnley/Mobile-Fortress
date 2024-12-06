extends Node2D

@onready var tilemap = $TileMapLayer
@onready var pointer_tower = preload("res://Towers/Pointer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cell_vectors = tilemap.get_used_cells()
	for v in cell_vectors:
		var is_tower: bool = tilemap.get_cell_tile_data(v).get_custom_data("tower")
		if is_tower:
			var t = pointer_tower.instantiate()
			t.global_position = tilemap.map_to_local(v)
			self.add_child(t)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
