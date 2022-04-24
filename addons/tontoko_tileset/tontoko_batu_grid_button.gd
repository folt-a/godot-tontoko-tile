tool
extends Button

class_name TontokoBatuGridButton

var _batu_image = preload("res://addons/tontoko_tileset/images/batu.svg")
var _batu_grid_image = preload("res://addons/tontoko_tileset/images/batu-grid-24.svg")
var _empty_grid_image = preload("res://addons/tontoko_tileset/images/empty-grid-24.svg")
var _empty_image:Image = Image.new()

export (Vector2) var coord = Vector2.ZERO

func _ready():
	_empty_image.create(_batu_grid_image.get_width(),_batu_grid_image.get_height(),false,_batu_grid_image.get_data().get_format())
	connect("toggled",self,"_on_toggled")
	
func get_icon_image() -> Image:
	if icon == null:
		return _empty_image
	return _batu_grid_image.get_data()
	
func _on_toggled(is_on:bool):
	if is_on:
		icon = _batu_image
	else:
		icon = null

func get_coord(cell_size:int) -> Vector2:
	if pressed:
		return coord * cell_size
	else:
		return Vector2.ZERO

func get_shape(tile_size,subtile_size:int) -> PoolVector2Array:
	var array = PoolVector2Array([])
	if pressed:
		return PoolVector2Array([coord * tile_size,\
		Vector2((coord.x * tile_size) + subtile_size,(coord.y * tile_size)),\
		Vector2((coord.x * tile_size) + subtile_size, (coord.y * tile_size) + subtile_size),\
		Vector2((coord.x * tile_size), (coord.y * tile_size) + subtile_size)])
	else:
		return PoolVector2Array([])
