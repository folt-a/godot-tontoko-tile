tool
extends GraphNode

onready var _parent_graph_edit:TontokoGraphEdit = get_parent()

var _offset

func _ready():
	connect("dragged",self,"_on_dragged")
	_offset = offset

func _on_dragged(from, to):
	if _parent_graph_edit.is_lock and self != _parent_graph_edit.grid_cursor:
		offset = from
	else:
		# グリッド強制
		offset = _parent_graph_edit.get_forced_grid(offset)
