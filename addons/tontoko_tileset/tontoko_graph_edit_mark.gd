tool
extends GraphEdit

class_name TontokoGraphEditMark

export (NodePath) var _graph_edit_image_path
onready var _graph_edit_image:GraphEdit = get_node(_graph_edit_image_path)
export (NodePath) var _graph_edit_paint_path
onready var _graph_edit_paint:GraphEdit = get_node(_graph_edit_paint_path)

onready var colorRectX:ColorRect = get_node("../ContainerGridRect/ColorRectX")
onready var colorRectX2:ColorRect = get_node("../ContainerGridRect/ColorRectX2")
onready var colorRectY:ColorRect = get_node("../ContainerGridRect/ColorRectY")
onready var colorRectY2:ColorRect = get_node("../ContainerGridRect/ColorRectY2")

export var mark_color:Color = Color(255,255,255,255)
export var mark_node_dic:Dictionary = {}
export var mark_cell_dic:Dictionary = {}

export var CellSize:int

export var is_lock = false
onready var _zoom = zoom

var is_scroll_hidden:bool = false
var _h_scroll
var _v_scroll

func _ready():
#	DebugStatus.add_stat("mark_dic", self, "mark_dic", false)
	# GraphEditのミニマップボタンなど、みせたくないものを非表示にする
	for node in get_children():
		if !(node is ColorRect)\
		and !(node is GraphNode)\
		and !(node.name == "CLAYER"):
			_h_scroll = node.get_child(0)
			_v_scroll = node.get_child(1)
			var hbox = node.get_child(2) # HBOXCONTAINER
			hbox.get_child(1).connect("pressed",self,"_zoom_sync") # -
			hbox.get_child(2).connect("pressed",self,"_zoom_sync") # 1:1
			hbox.get_child(3).connect("pressed",self,"_zoom_sync") # +
			hbox.get_child(4).visible = false # Snap On\Off
			hbox.get_child(5).visible = false # Snap Distance
			hbox.get_child(6).visible = false # Minimap On\Off
	
func show_scrollbar():
	is_scroll_hidden = true
	update_scrollbar()

func hide_scrollbar():
	is_scroll_hidden = false
	update_scrollbar()
	
func update_scrollbar():
	_h_scroll.visible = is_scroll_hidden
	_v_scroll.visible = is_scroll_hidden

func change_color(color:Color):
	mark_color = color
	for node in get_children():
		if node is GraphNode:
			node.get_child(0).modulate = mark_color

func _gui_input(event:InputEvent):
	if event is InputEventMouseButton and event.control\
		and (event.button_index == BUTTON_WHEEL_UP or event.button_index == BUTTON_WHEEL_DOWN)\
		and event.is_pressed():
		# ズームを検知して、画像のGraphEditと同期する
		call_deferred("_zoom_sync")
	return true

func _zoom_sync():
	_graph_edit_image.zoom = zoom
	_graph_edit_image.scroll_offset = scroll_offset
	_graph_edit_image.update_canvas()
	_graph_edit_image.call_deferred("update_scrollbar")
	_graph_edit_paint.zoom = zoom
	_graph_edit_paint.scroll_offset = scroll_offset
	_graph_edit_paint.call_deferred("update_scrollbar")

func get_all_graph_nodes() -> Array:
	var tiles = []
	for node in get_children():
		if node is GraphNode:
			tiles.append(node)
	tiles.sort_custom(self,"_customComparison")
	return tiles

func unselect_all_graph_nodes() -> void:
	for node in get_children():
		if node is GraphNode:
			node.selected = false

func get_selected_graph_nodes() -> Array:
	var selected_tiles = []
	for node in get_children():
		if node is GraphNode and node.selected:
			selected_tiles.append(node)
	return selected_tiles

# 選択中のノードを位置でソートしてGraphNode配列で返す
func get_sorted_selected_graph_nodes() -> Array:
	var selected_nodes = []
	for node in get_children():
		if node is GraphNode and node.selected:
			selected_nodes.append(node)
	selected_nodes.sort_custom(self,"_customComparison")
	return selected_nodes

# Sort用比較関数
static func _customComparison(a:GraphNode, b:GraphNode):
#	左上→右上→次の行　のように並び替え
#	yで昇順ソートし、yが同じならxで昇順ソート
	if a.offset.y == b.offset.y:
		return a.offset.x < b.offset.x
	return a.offset.y < b.offset.y
	return false

func get_forced_grid(vec2) -> Vector2:
	return Vector2(
		int(vec2.x) - int(vec2.x) % CellSize,
		int(vec2.y) - int(vec2.y) % CellSize
	)

func _on_GraphEditPaint_scroll_offset_changed(ofs):
	_zoom_sync()

var _nodes_clipboard = []
func _on_GraphEditMark_copy_nodes_request():
	_nodes_clipboard = get_sorted_selected_graph_nodes()
	for node in _nodes_clipboard:
		node.selected = false

func _on_GraphEditMark_paste_nodes_request():
	var mouse_cell_offset = get_forced_grid(get_local_mouse_position() / zoom + scroll_offset)
	if _nodes_clipboard.size() == 0:return
	unselect_all_graph_nodes()
	var first_offset = _nodes_clipboard[0].offset
	for node in _nodes_clipboard:
		var new_node = node.duplicate()
		new_node.offset = mouse_cell_offset + node.offset - first_offset
		new_node.selected = true
		add_child(new_node)

#func add_grid_mark(point_snapped,graph:GraphNode) -> void:
#	if mark_cell_dic.has(point_snapped):
#		# 削除して新規追加
#		remove_grid_mark(point_snapped)
#		add_child(graph)
#
#		tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
#		paint_graph_node.mouse_filter = Control.MOUSE_FILTER_IGNORE
#
#		tex_rect.rect_min_size = Vector2(CellSize,CellSize)
#		tex_rect.rect_size = Vector2(CellSize,CellSize)
#
#		_graph_mark.mark_node_dic[point_snapped] = paint_graph_node
#		_graph_mark.mark_cell_dic[point_snapped] = paint_graph_node
#	else:
#		# 新規追加
#		_graph_mark.add_child(paint_graph_node)
#
#		tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
#		paint_graph_node.mouse_filter = Control.MOUSE_FILTER_IGNORE
#
#		tex_rect.rect_min_size = Vector2(CellSize,CellSize)
#		tex_rect.rect_size = Vector2(CellSize,CellSize)
#
#		_graph_mark.mark_node_dic[point_snapped] = paint_graph_node
#		_graph_mark.mark_cell_dic[point_snapped] = paint_graph_node

func remove_grid_mark(point_snapped:Vector2) -> void:
	if !mark_cell_dic.has(point_snapped):return
#	mark_cell_dic[point_snapped].remove_child(mark_cell_dic[point_snapped].get_child(0))
	remove_child(mark_cell_dic[point_snapped])
	mark_node_dic.erase(point_snapped)
	mark_cell_dic.erase(point_snapped)

func move_grid_mark(point_snapped:Vector2,graph:GraphNode) -> void:
	remove_grid_mark(point_snapped)
	
#	add_child(graph)
#	mark_node_dic[graph.offset/CellSize] = graph
#	mark_cell_dic[graph.offset/CellSize] = graph.offset/CellSize

