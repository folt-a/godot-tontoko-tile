tool
extends GraphEdit

class_name TontokoGraphEdit

export (NodePath) var _graph_edit_paint_path
onready var _graph_edit_paint:GraphEdit = get_node(_graph_edit_paint_path)
export (NodePath) var _graph_edit_mark_path
onready var _graph_edit_mark:GraphEdit = get_node(_graph_edit_mark_path)

onready var grid_canvas:Control = $GridCanvas
onready var grid_cursor:Control = $GraphNodeCursor
onready var colorRectX:ColorRect = get_node("../ContainerGridRect/ColorRectX")
onready var colorRectX2:ColorRect = get_node("../ContainerGridRect/ColorRectX2")
onready var colorRectY:ColorRect = get_node("../ContainerGridRect/ColorRectY")
onready var colorRectY2:ColorRect = get_node("../ContainerGridRect/ColorRectY2")

export var CellSize:int

export var is_lock = false
onready var _zoom = zoom

signal release_drag_rect
signal release_drag_rect_right

# Vector2(0.1,0.1)はnullの代用（少数になることはないので）
var drag_start_rect:Vector2 = Vector2(0.1,0.1)

var _draw_rect_start_left = Vector2.ZERO
var _draw_rect_start_right = Vector2.ZERO

var is_scroll_hidden:bool = true
var _h_scroll
var _v_scroll

func _ready():
	colorRectX.rect_size.y = 1
	colorRectX2.rect_size.y = 1
	colorRectY.rect_size.x = 1
	colorRectY2.rect_size.x = 1
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

func _gui_input(event:InputEvent):
	if event is InputEventMouseButton and event.control\
		and (event.button_index == BUTTON_WHEEL_UP or event.button_index == BUTTON_WHEEL_DOWN)\
		and event.is_pressed():
		# ズームを検知して、画像のGraphEditと同期する
		call_deferred("_zoom_sync")
	return true

func _zoom_sync():
	_graph_edit_paint.zoom = zoom
	_graph_edit_paint.scroll_offset = scroll_offset
	_graph_edit_paint.call_deferred("update_scrollbar")
	_graph_edit_mark.zoom = zoom
	_graph_edit_mark.scroll_offset = scroll_offset
	_graph_edit_mark.call_deferred("update_scrollbar")
	update_canvas()
	
func update_canvas():
	grid_canvas.rect_position = -scroll_offset
	grid_canvas.rect_scale = Vector2(zoom,zoom)
	
	if zoom == 1:
		colorRectX.rect_size.y = 1
		colorRectX2.rect_size.y = 1
		colorRectY.rect_size.x = 1
		colorRectY2.rect_size.x = 1
	else:
		colorRectX.rect_size.y = 0
		colorRectX2.rect_size.y = 0
		colorRectY.rect_size.x = 0
		colorRectY2.rect_size.x = 0
	colorRectX.rect_size.x = rect_size.x
	colorRectX2.rect_size.x = rect_size.x
	colorRectY.rect_size.y = rect_size.y
	colorRectY2.rect_size.y = rect_size.y
	
	colorRectX.rect_global_position.y = grid_canvas.rect_global_position.y
	colorRectX2.rect_global_position.y = grid_canvas.rect_global_position.y + grid_canvas.rect_size.y
	colorRectY.rect_global_position.x = grid_canvas.rect_global_position.x - 1
	colorRectY2.rect_global_position.x = grid_canvas.rect_global_position.x + grid_canvas.rect_size.x - 1


func _on_GraphEdit_scroll_offset_changed(ofs):
	_zoom_sync()
	
func get_cursor_cell()->Vector2:
	return grid_cursor.offset

func set_cursor_cell(pos:Vector2)->void:
	grid_cursor.offset = pos

func get_all_graph_nodes() -> Array:
	var tiles = []
	for node in get_children():
		if node is GraphNode and node != grid_cursor:
			tiles.append(node)
	tiles.sort_custom(self,"_customComparison")
	return tiles

func get_selected_graph_nodes() -> Array:
	var selected_tiles = []
	for node in get_children():
		if node is GraphNode and node != grid_cursor and node.selected:
			selected_tiles.append(node)
	return selected_tiles

func unselect_all_graph_nodes() -> void:
	for node in get_children():
		if node is GraphNode:
			node.selected = false

func get_bottom() -> int:
	var bottom = 0
	for node in get_children():
		if node is GraphNode and node != grid_cursor:
			if bottom < node.offset.y:
				bottom = node.offset.y
	return bottom

# 選択中のノードを位置でソートしてGraphNode配列で返す
func get_sorted_selected_graph_nodes() -> Array:
	var selected_nodes = []
	for node in get_children():
		if node is GraphNode and node.selected and node != grid_cursor:
			selected_nodes.append(node)
	selected_nodes.sort_custom(self,"_customComparison")
	return selected_nodes

# 選択中の1セルノードを位置でソートしてGraphNode配列で返す
func get_sorted_selected_1_cell_graph_nodes() -> Array:
	var selected_nodes = []
	for node in get_children():
		if node is GraphNode and node.selected and node != grid_cursor\
		and abs(node.rect_size.x - CellSize) <= 0.1\
		and abs(node.rect_size.y - CellSize) <= 0.1 :
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

var _nodes_clipboard = []

func _on_GraphEditImage_copy_nodes_request():
	_nodes_clipboard = get_sorted_selected_graph_nodes()
	for node in _nodes_clipboard:
		node.selected = false

func _on_GraphEditImage_paste_nodes_request():
	var mouse_cell_offset = get_forced_grid(get_local_mouse_position() + scroll_offset)
	if _nodes_clipboard.size() == 0:return
	unselect_all_graph_nodes()
	var first_offset = _nodes_clipboard[0].offset
	for node in _nodes_clipboard:
		var new_node = node.duplicate()
		new_node.offset = mouse_cell_offset + node.offset - first_offset
		add_child(new_node)
