tool
extends GraphEdit

class_name TontokoGraphEditPaint

export (NodePath) var _graph_edit_image_path
onready var _graph_edit_image:GraphEdit = get_node(_graph_edit_image_path)
export (NodePath) var _graph_edit_mark_path
onready var _graph_edit_mark:GraphEdit = get_node(_graph_edit_mark_path)

export var CellSize:int

export var is_lock = false
onready var _zoom = zoom

signal release_drag_rect
signal release_drag_rect_right

# Vector2(0.1,0.1)はnullの代用（少数になることはないので）
var drag_start_rect:Vector2 = Vector2(0.1,0.1)

var _draw_rect_start_left = Vector2.ZERO
var _draw_rect_start_right = Vector2.ZERO

var is_scroll_hidden:bool = false
var _h_scroll
var _v_scroll

func _ready():
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
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed and drag_start_rect == Vector2(0.1,0.1):
			drag_start_rect = get_forced_grid((get_local_mouse_position() + scroll_offset)/ zoom) / CellSize
			_draw_rect_start_left = get_local_mouse_position()
			
		elif drag_start_rect != Vector2(0.1,0.1):
			var drag_end_rect = get_forced_grid((get_local_mouse_position() + scroll_offset)/ zoom) / CellSize
			emit_signal("release_drag_rect",drag_start_rect,drag_end_rect)
			drag_start_rect = Vector2(0.1,0.1)
			_draw_rect_start_left = Vector2.ZERO
		else:
			drag_start_rect = Vector2(0.1,0.1)
	elif event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		if event.pressed and drag_start_rect == Vector2(0.1,0.1):
			drag_start_rect = get_forced_grid((get_local_mouse_position() + scroll_offset)/ zoom) / CellSize
			_draw_rect_start_right = get_local_mouse_position()
			
		elif drag_start_rect != Vector2(0.1,0.1):
			var drag_end_rect = get_forced_grid((get_local_mouse_position() + scroll_offset)/ zoom) / CellSize
			emit_signal("release_drag_rect_right",drag_start_rect,drag_end_rect)
			drag_start_rect = Vector2(0.1,0.1)
			_draw_rect_start_right = Vector2.ZERO
		else:
			drag_start_rect = Vector2(0.1,0.1)
	elif event is InputEventMouseMotion:
		update()
	elif event is InputEventMouseButton and event.control\
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
	_graph_edit_mark.zoom = zoom
	_graph_edit_mark.scroll_offset = scroll_offset
	_graph_edit_mark.call_deferred("update_scrollbar")

func _draw():
	if _draw_rect_start_left != Vector2.ZERO:
		# Select Rect
		draw_rect(Rect2(_draw_rect_start_left,get_local_mouse_position() - _draw_rect_start_left), Color( 0.5, 1, 0.83, 0.4))
	if _draw_rect_start_right != Vector2.ZERO:
		# Delete Rect
		draw_rect(Rect2(_draw_rect_start_right,get_local_mouse_position() - _draw_rect_start_right), Color( 0.86, 0.08, 0.24, 0.4))
	pass

func get_forced_grid(vec2) -> Vector2:
	return Vector2(
		int(vec2.x) - int(vec2.x) % CellSize,
		int(vec2.y) - int(vec2.y) % CellSize
	)

func _on_GraphEditPaint_scroll_offset_changed(ofs):
	_zoom_sync()
