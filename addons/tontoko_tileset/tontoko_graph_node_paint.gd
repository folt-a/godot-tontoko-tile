tool
extends GraphNode

signal remove

onready var _parent_graph_edit:TontokoGraphEditMark = get_parent()

var _offset

func _ready():
	connect("dragged",self,"_on_dragged")
	_offset = offset

func _on_dragged(from, to):
	if from == to:return
	if _parent_graph_edit.is_lock:
		offset = from
	else:
		# グリッド強制
		offset = _parent_graph_edit.get_forced_grid(offset)
		if _parent_graph_edit.mark_cell_dic.has(offset/_parent_graph_edit.CellSize):
			_parent_graph_edit.remove_grid_mark(offset/_parent_graph_edit.CellSize)
		_parent_graph_edit.mark_cell_dic[offset/_parent_graph_edit.CellSize] = self
		_parent_graph_edit.move_grid_mark(offset/_parent_graph_edit.CellSize,to)

#			_parent_graph_edit.mark_dic.erase(offset/_parent_graph_edit.CellSize)
