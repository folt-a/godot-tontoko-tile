tool
extends MarginContainer

var _tontokoImageScript = preload("res://addons/tontoko_tileset/tontoko_image.gd")
onready var TontokoImage:TontokoImage = _tontokoImageScript.new()

onready var _btn_select_image:Button = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/SelectButton
onready var _btn_auto_add:CheckBox = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/AutoAdd
onready var _btn_add:Button = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/Add/AddButton
onready var _edit_add:LineEdit = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/LineEdit
onready var _item_list:ItemList = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/ItemList
onready var _preview_rect:TextureRect = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/imageInfo/Preview

var _tree_root:TreeItem

onready var _opt_tile_type:OptionButton = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/OptionButtonWorT
enum TILETYPE {NORMAL,WOLF,MAKER}

onready var _opt_grid_canvas_px_or_cell:OptionButton = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/OptionButtonPxOrCell
onready var _spin_grid_canvas_width:SpinBox = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth
onready var _spin_grid_canvas_height:SpinBox = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight

onready var _check_canvas_size_fit:CheckBox = $VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/CheckBoxCanvasSizeFit

onready var _grid_panel:PanelContainer = $VBoxC/TabC/Tile/Main/VBoxC/Grid
onready var _graph:TontokoGraphEdit = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditImage
onready var _graph_cursor:GraphNode = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditImage/GraphNodeCursor
onready var _grid_rect_cont = $VBoxC/TabC/Tile/Main/VBoxC/Grid/ContainerGridRect
onready var _graph_mark:GraphEdit = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditMark
onready var _graph_paint:GraphEdit = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditPaint
onready var _grid_canvas = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditImage/GridCanvas

var _mode = TOOLMODE.MOVE
enum TOOLMODE {MOVE,MARKMOVE,CURSOR,MARU,BATU,HOSHI,HOSHI2,SANKAKU,KESHIGOMU,BATUGRID}
onready var _subtool_button_move = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Move
onready var _subtool_button_mark_move = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Move
onready var _subtool_button_maru = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Move
onready var _subtool_button_batu = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Move

onready var _subtool_button_move_lock = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/MoveLock
onready var _subtool_button_single_tile = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/SingleTileConcat
onready var _subtool_button_auto_tile = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/AutoTileRecog
onready var _subtool_button_trash = $VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/Trash

onready var _spin_z_index_maru = $VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexMaru
onready var _spin_z_index_sankaku = $VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexSankaku
onready var _spin_z_index_hoshi = $VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexHoshi
onready var _spin_z_index_hoshi2 = $VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexHoshi2

onready var _batu_grid = $VBoxC/TabC/Tile/Main/Tools/BatuGrid

var tab_tile_icon = preload("res://addons/tontoko_tileset/images/tile-24.svg")
var tab_help_icon = preload("res://addons/tontoko_tileset/images/circle-question-24.svg")

var maru_image = preload("res://addons/tontoko_tileset/images/maru-24.svg")
var batu_image = preload("res://addons/tontoko_tileset/images/batu-24.svg")
var hoshi_image = preload("res://addons/tontoko_tileset/images/hoshi-24.svg")
var hoshi2_image = preload("res://addons/tontoko_tileset/images/hoshi2-24.svg")
var sankaku_image = preload("res://addons/tontoko_tileset/images/sankaku-24.svg")
var kesigomu_image = preload("res://addons/tontoko_tileset/images/keshigomu.svg")

var normal_tile_icon = preload("res://addons/tontoko_tileset/images/tile-24.svg")
var rpg_icon = preload("res://addons/tontoko_tileset/images/circle-r-24.svg")
var wolf_icon = preload("res://addons/tontoko_tileset/images/circle-w-24.svg")

var selected_graph_node_stylebox = preload("res://addons/tontoko_tileset/selected_graph_node_styleboxflat.tres")
var selected_auto_tile_graph_node_stylebox = preload("res://addons/tontoko_tileset/selected_auto_tile_graph_node_styleboxflat.tres")
var selected_multi_single_graph_node_stylebox = preload("res://addons/tontoko_tileset/selected_multi_single_graph_node_styleboxflat.tres")

var graph_node_image_script = load("res://addons/tontoko_tileset/tontoko_graph_node_image.gd")
var graph_node_paint_script = load("res://addons/tontoko_tileset/tontoko_graph_node_paint.gd")

onready var _picker_paint = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCPaintColor/ColorPickerButtonPaint

var CellSize:int = 32
var HalfCellSize:int = 16
var GridCanvasSize:Vector2 = Vector2.ZERO
var CanvasMaxY = 0
onready var _bottomRightGraphNode:GraphNode = $VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditPaint/BottomRightGraphNode

const BITMASK_AUTO_TILE_3X1 = [ Vector2( 0, 0 ), 25559088, Vector2( 1, 0 ), 29818936, Vector2( 2, 0 ), 12779544 ]
const BITMASK_AUTO_TILE_1X3 = [ Vector2( 0, 0 ), 23593104, Vector2( 0, 1 ), 23920786, Vector2( 0, 2 ), 2949138 ]
const BITMASK_AUTO_TILE_3X2 = [ Vector2( 0, 0 ), 393648, Vector2( 0, 1 ), 54, Vector2( 1, 0 ), 459256, Vector2( 1, 1 ), 63, Vector2( 2, 0 ), 196824, Vector2( 2, 1 ), 27 ]
const BITMASK_AUTO_TILE_3X3 = [ Vector2( 0, 0 ), 432, Vector2( 0, 1 ), 438, Vector2( 0, 2 ), 54, Vector2( 1, 0 ), 504, Vector2( 1, 1 ), 511, Vector2( 1, 2 ), 63, Vector2( 2, 0 ), 216, Vector2( 2, 1 ), 219, Vector2( 2, 2 ), 27 ]
const BITMASK_AUTO_TILE_W_AND_T = [ Vector2( 0, 0 ), 511, Vector2( 0, 1 ), 251, Vector2( 0, 2 ), 191, Vector2( 0, 3 ), 182, Vector2( 0, 4 ), 219, Vector2( 0, 5 ), 59, Vector2( 0, 6 ), 216, Vector2( 0, 7 ), 144, Vector2( 1, 0 ), 510, Vector2( 1, 1 ), 250, Vector2( 1, 2 ), 190, Vector2( 1, 3 ), 178, Vector2( 1, 4 ), 155, Vector2( 1, 5 ), 58, Vector2( 1, 6 ), 152, Vector2( 1, 7 ), 48, Vector2( 2, 0 ), 507, Vector2( 2, 1 ), 447, Vector2( 2, 2 ), 187, Vector2( 2, 3 ), 504, Vector2( 2, 4 ), 218, Vector2( 2, 5 ), 146, Vector2( 2, 6 ), 27, Vector2( 2, 7 ), 18, Vector2( 3, 0 ), 506, Vector2( 3, 1 ), 446, Vector2( 3, 2 ), 186, Vector2( 3, 3 ), 248, Vector2( 3, 4 ), 154, Vector2( 3, 5 ), 56, Vector2( 3, 6 ), 26, Vector2( 3, 7 ), 24, Vector2( 4, 0 ), 255, Vector2( 4, 1 ), 443, Vector2( 4, 2 ), 438, Vector2( 4, 3 ), 440, Vector2( 4, 4 ), 63, Vector2( 4, 5 ), 432, Vector2( 4, 6 ), 54, Vector2( 4, 7 ), 16, Vector2( 5, 0 ), 254, Vector2( 5, 1 ), 442, Vector2( 5, 2 ), 434, Vector2( 5, 3 ), 184, Vector2( 5, 4 ), 62, Vector2( 5, 5 ), 176, Vector2( 5, 6 ), 50 ]
var IsAutoTile:bool = true

var tool_btn_group:ButtonGroup

func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())
#	TranslationServer.set_locale("en")
#	print(OS.get_locale())
#	DebugStatus.add_stat("_graph_mark.mark_cell_dic", self, "_graph_mark.mark_cell_dic", false)
	# Tab
	$VBoxC/TabC.current_tab = 0
	$VBoxC/TabC.set_tab_icon(0,tab_tile_icon)
	$VBoxC/TabC.set_tab_icon(1,tab_help_icon)
	if TranslationServer.get_locale() == "ja_JP":
		$VBoxC/TabC.set_tab_title(0,"タイルセット")
		$VBoxC/TabC.set_tab_title(1,"ヘルプ")
	else:
		$VBoxC/TabC.set_tab_title(0,"TileSet")
		$VBoxC/TabC.set_tab_title(1,"Help")
	
	$MarginC/FileDialog.add_filter("*.png ;")
	$MarginC/FileDialog.resizable = true
	tool_btn_group = _subtool_button_mark_move.group                              
	
	# Grid
	_opt_tile_type.clear()
	_opt_grid_canvas_px_or_cell.clear()
	if TranslationServer.get_locale() == "ja_JP":
		_opt_tile_type.add_icon_item(normal_tile_icon,"通常タイル",0)
		_opt_tile_type.add_icon_item(wolf_icon,"オートタイル ウディタ",1)
		_opt_tile_type.add_icon_item(rpg_icon,"オートタイル ツクール ",2)
		
		_opt_grid_canvas_px_or_cell.add_item("ピクセル",0)
		_opt_grid_canvas_px_or_cell.add_item("マス",1)
	else:
		_opt_tile_type.add_icon_item(normal_tile_icon,"Normal_Tile",0)
		_opt_tile_type.add_icon_item(wolf_icon,"AutoTile_WOLF",1)
		_opt_tile_type.add_icon_item(rpg_icon,"AutoTile_RPGMaker ",2)
		_opt_grid_canvas_px_or_cell.add_item("Pixel",0)
		_opt_grid_canvas_px_or_cell.add_item("Cell",1)
	_opt_grid_canvas_px_or_cell.select(1)
	# Grid位置
	_graph.CellSize = CellSize
	_graph_mark.CellSize = CellSize
	_graph_paint.CellSize = CellSize
	
	_graph.scroll_offset = Vector2(-CellSize*2,-CellSize*2)
	_graph_mark.scroll_offset = Vector2(-CellSize*2,-CellSize*2)
	_graph_paint.scroll_offset = Vector2(-CellSize*2,-CellSize*2)
	
	_grid_canvas.rect_position = -_graph.scroll_offset
	
	# 翻訳
	if TranslationServer.get_locale() != "ja_JP":
		translate()

#	保持データ復元
	_setting_restore()

func _on_SelectButton_pressed() -> void:
	$MarginC/FileDialog.invalidate()
	$MarginC/FileDialog.popup()
	$MarginC.visible = true
	$MarginC.add_constant_override("margin_top", self.rect_size.y * 0.2)
	$MarginC.add_constant_override("margin_left", self.rect_size.x * 0.2)
	$MarginC.add_constant_override("margin_bottom", self.rect_size.y * 0.2)
	$MarginC.add_constant_override("margin_right", self.rect_size.x * 0.2)

func _on_FileDialog_popup_hide() -> void:
	$MarginC.visible = false

var _is_row_first_image = true
func _on_FileDialog_files_selected(paths:PoolStringArray) -> void:
	_is_row_first_image = true
	var loaded_image
	for path in paths:
		loaded_image = _add_image(path)
		_is_row_first_image = false
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/imageInfo/Preview.texture = loaded_image

func _add_image(path:String) -> Texture:
	# TODO
	_item_list.add_item(path.get_file())
	var item_index = _item_list.get_item_count() - 1
	var loaded_image:Texture = load(path)
	
	_item_list.set_item_metadata(item_index,loaded_image)
	_item_list.set_item_tooltip(item_index,path)
	_item_list.set_item_tooltip_enabled(item_index,true)
	
	# キャンバスのサイズを合わせる☑チェックボックス 幅
	if _check_canvas_size_fit.pressed\
		and loaded_image.get_width() > _get_grid_canvas_size().x:
			if _opt_grid_canvas_px_or_cell.selected == 0:
				# pixel
				_spin_grid_canvas_width.value = loaded_image.get_width()
			else:
				# cell
				_spin_grid_canvas_width.value = loaded_image.get_width() / CellSize
			_on_SpinBoxGridCanvas_value_changed(-1)
			
	var image_array = [[]]
	
	# ノーマルタイルはカット、オートタイルは変換
	match _opt_tile_type.selected:
		TILETYPE.NORMAL:
			image_array = TontokoImage.cut_Spritesheet(loaded_image.get_data(),Vector2(CellSize,CellSize))
		TILETYPE.WOLF:
			image_array = TontokoImage.cut_Spritesheet(loaded_image.get_data(),Vector2(CellSize,CellSize * 5))
		TILETYPE.MAKER:
			image_array = TontokoImage.cut_Spritesheet(loaded_image.get_data(),Vector2(CellSize * 2,CellSize * 3))
	# エラー☑
	if image_array.size() == 0:
		_show_error("画像を読み込めませんでした。\nサイズを確認してください。")
	var start_cell = _graph.get_cursor_cell()
	for row in image_array:	
		for image in row:
			if image == null and _opt_tile_type.selected == TILETYPE.NORMAL:
				# 透明セルなら空埋めとしてスペースを開ける
				# オートタイルの場合は開けない
				
				# 1セル分右へカーソル移動
				_graph.set_cursor_cell(Vector2(_graph.get_cursor_cell().x + CellSize,_graph.get_cursor_cell().y))
				
				# カーソルが範囲外にでたら次行にカーソル移動する
				if _graph.get_cursor_cell().x >= _get_grid_canvas_size().x:
					_graph.set_cursor_cell(Vector2(start_cell.x,CanvasMaxY))
				continue
			
			var graph_node = GraphNode.new()
			var tex_rect = TextureRect.new()
			
			var tex = ImageTexture.new()
			var tmp_tex = ImageTexture.new()
			tmp_tex.create_from_image(image)
			
			match _opt_tile_type.selected:
				TILETYPE.NORMAL:
					tex = tmp_tex
					graph_node.add_stylebox_override("selectedframe",selected_graph_node_stylebox)
					graph_node.set_meta("single","")
				TILETYPE.WOLF:
					tex.create_from_image(TontokoImage.conv_wolf(tmp_tex))
					graph_node.add_stylebox_override("selectedframe",selected_auto_tile_graph_node_stylebox)
					graph_node.set_meta("auto_tile","wolf")
				TILETYPE.MAKER:
					tex.create_from_image(TontokoImage.conv_maker(tmp_tex))
					graph_node.add_stylebox_override("selectedframe",selected_auto_tile_graph_node_stylebox)
					graph_node.set_meta("auto_tile","wolf")
			tex_rect.texture = tex
			tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			# GraphNodeの設定
			graph_node.set_meta("image_path",path)
			graph_node.set_script(graph_node_image_script)
			_graph.add_child(graph_node)
			graph_node.add_child(tex_rect)
			_graph.move_child(graph_node, 2)
			
			if _is_row_first_image or tex_rect.rect_size.x > _get_grid_canvas_size().x:
				# １枚目もしくは1枚の画像が横幅より大きい場合はそのままはる
				graph_node.offset = _graph.get_cursor_cell()
				_is_row_first_image = false
			elif _get_grid_canvas_size().x < _graph.get_cursor_cell().x + tex_rect.rect_size.x:
				# 横に入りきらなければ折り返して次行にカーソル移動してはる, 
				_graph.set_cursor_cell(Vector2(0,CanvasMaxY))
				graph_node.offset = Vector2(0,CanvasMaxY)
				_is_row_first_image = false
			else:
				graph_node.offset = _graph.get_cursor_cell()
			
			# Mark add Maru
			var tmp_mode = _mode
			_mode = TOOLMODE.MARU
			_add_grid_mark(graph_node.offset / CellSize)
			_mode = tmp_mode
			
			# 最下位置なら更新
			if CanvasMaxY < graph_node.offset.y + tex_rect.rect_size.y:
				CanvasMaxY = graph_node.offset.y + tex_rect.rect_size.y
				_bottomRightGraphNode.offset.y = CanvasMaxY
				
			# 画像サイズ分右へカーソル移動
			_graph.set_cursor_cell(Vector2(_graph.get_cursor_cell().x + tex_rect.rect_size.x,_graph.get_cursor_cell().y))
			
			# カーソルが範囲外にでたら次行にカーソル移動する
			if _graph.get_cursor_cell().x >= _get_grid_canvas_size().x:
				if _opt_tile_type.selected == TILETYPE.NORMAL:
					_graph.set_cursor_cell(Vector2(start_cell.x,CanvasMaxY))
				else:
					_graph.set_cursor_cell(Vector2(0,CanvasMaxY))
		
		# オートタイルでないときは改行
		if _opt_tile_type.selected == TILETYPE.NORMAL:
			_graph.set_cursor_cell(Vector2(start_cell.x,CanvasMaxY))
	
	if _check_canvas_size_fit.pressed:
		if _opt_grid_canvas_px_or_cell.selected == 0:
			# pixel
			_spin_grid_canvas_height.value = CanvasMaxY
		else:
			# cell
			_spin_grid_canvas_height.value = CanvasMaxY / CellSize
		_on_SpinBoxGridCanvas_value_changed(-1)
	
	return loaded_image

func _on_AutoAdd_pressed() -> void:
	# 自動追加がONのときは複数ファイル可にする
	if _btn_auto_add.disabled:
		$MarginC/FileDialog.mode = FileDialog.MODE_OPEN_FILE
	else:
		$MarginC/FileDialog.mode = FileDialog.MODE_OPEN_FILES
	# Addボタン有効をトグル
	_btn_add.visible = !_btn_add.visible
	_edit_add.visible = !_edit_add.visible
	_btn_add.disabled = !_btn_add.disabled
	_edit_add.editable = !_edit_add.editable

func _on_GridRect_point_clicked(point, point_snapped, local_position):
	return
	if _mode == TOOLMODE.KESHIGOMU:
		if _graph_mark.mark_cell_dic.has(point_snapped):
			_graph_mark.remove_grid_mark(point_snapped)
		return
	_add_grid_mark(point_snapped)

func _add_grid_mark(point_snapped:Vector2) -> void:
	if point_snapped.x < 0 or point_snapped.y < 0:
		return
	
	var paint_graph_node = GraphNode.new()
	var tex_rect = TextureRect.new()
	match _mode:
		TOOLMODE.CURSOR:
			_graph.set_cursor_cell(point_snapped * CellSize)
			tex_rect.set_meta("paint",TOOLMODE.CURSOR)
			return
		TOOLMODE.MOVE:
			return
		TOOLMODE.MARU:
			tex_rect.texture = maru_image
			tex_rect.set_meta("paint",TOOLMODE.MARU)
		TOOLMODE.BATU:
			tex_rect.texture = batu_image
			tex_rect.set_meta("paint",TOOLMODE.BATU)
		TOOLMODE.HOSHI:
			tex_rect.texture = hoshi_image
			tex_rect.set_meta("paint",TOOLMODE.HOSHI)
		TOOLMODE.HOSHI2:
			tex_rect.texture = hoshi2_image
			tex_rect.set_meta("paint",TOOLMODE.HOSHI2)
		TOOLMODE.SANKAKU:
			tex_rect.texture = sankaku_image
			tex_rect.set_meta("paint",TOOLMODE.SANKAKU)
		TOOLMODE.BATUGRID:
			tex_rect.texture = _batu_grid.icon.duplicate()
			tex_rect.set_meta("paint",TOOLMODE.BATUGRID)
			tex_rect.set_meta("batu_grid",_batu_grid._selected_grids.duplicate())
	
	tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tex_rect.expand = true
	
	tex_rect.modulate = _picker_paint.color	
	paint_graph_node.offset = point_snapped * CellSize
	paint_graph_node.rect_size = Vector2(CellSize,CellSize)
	paint_graph_node.set_meta("paint_snapped_cell",point_snapped)
	paint_graph_node.add_child(tex_rect)
	paint_graph_node.set_script(graph_node_paint_script)
	
	# こまかいXと△、☆は重ねるので削除せず画像の変更、メタデータ上書きのみ実行
	if _graph_mark.mark_cell_dic.has(point_snapped) and\
	(_mode == TOOLMODE.BATUGRID and _graph_mark.mark_cell_dic[point_snapped].get_child(0).get_meta("paint") == TOOLMODE.SANKAKU):
		var already_image:Image = sankaku_image.get_data()
		var new_image:Image = tex_rect.texture.get_data()
		_graph_mark.mark_cell_dic[point_snapped].get_child(0).texture = TontokoImage.blend_add(already_image,new_image)
		_graph_mark.mark_cell_dic[point_snapped].get_child(0).set_meta("batu_grid",_batu_grid._selected_grids.duplicate())
	elif _graph_mark.mark_cell_dic.has(point_snapped) and\
	(_mode == TOOLMODE.BATUGRID and _graph_mark.mark_cell_dic[point_snapped].get_child(0).get_meta("paint") == TOOLMODE.HOSHI):
		var already_image:Image = hoshi_image.get_data()
		var new_image:Image = tex_rect.texture.get_data()
		_graph_mark.mark_cell_dic[point_snapped].get_child(0).texture = TontokoImage.blend_add(already_image,new_image)
		_graph_mark.mark_cell_dic[point_snapped].get_child(0).set_meta("batu_grid",_batu_grid._selected_grids.duplicate())
	
	if _graph_mark.mark_cell_dic.has(point_snapped):
		# こまかいXと△、☆は重ねるので削除せず画像の変更、メタデータ上書きのみ実行
		if (_mode == TOOLMODE.BATUGRID and _graph_mark.mark_cell_dic[point_snapped].get_child(0).get_meta("paint") == TOOLMODE.SANKAKU):
			var already_image:Image = sankaku_image.get_data()
			var new_image:Image = tex_rect.texture.get_data()
			_graph_mark.mark_cell_dic[point_snapped].get_child(0).texture = TontokoImage.blend_add(already_image,new_image)
			_graph_mark.mark_cell_dic[point_snapped].get_child(0).set_meta("batu_grid",_batu_grid._selected_grids.duplicate())
		elif (_mode == TOOLMODE.BATUGRID and _graph_mark.mark_cell_dic[point_snapped].get_child(0).get_meta("paint") == TOOLMODE.HOSHI):
			var already_image:Image = hoshi_image.get_data()
			var new_image:Image = tex_rect.texture.get_data()
			_graph_mark.mark_cell_dic[point_snapped].get_child(0).texture = TontokoImage.blend_add(already_image,new_image)
			_graph_mark.mark_cell_dic[point_snapped].get_child(0).set_meta("batu_grid",_batu_grid._selected_grids.duplicate())
			pass
		else:
			# 削除して新規追加
			_graph_mark.remove_grid_mark(point_snapped)
			_graph_mark.add_child(paint_graph_node)
			
			tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
			paint_graph_node.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			tex_rect.rect_min_size = Vector2(CellSize,CellSize)
			tex_rect.rect_size = Vector2(CellSize,CellSize)
			
			_graph_mark.mark_node_dic[point_snapped] = paint_graph_node
			_graph_mark.mark_cell_dic[point_snapped] = paint_graph_node
	else:
		# 新規追加
		_graph_mark.add_child(paint_graph_node)
		
		tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
		paint_graph_node.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
		tex_rect.rect_min_size = Vector2(CellSize,CellSize)
		tex_rect.rect_size = Vector2(CellSize,CellSize)
		
		_graph_mark.mark_node_dic[point_snapped] = paint_graph_node
		_graph_mark.mark_cell_dic[point_snapped] = paint_graph_node

func _on_Tool_toggled(button_pressed):
	if !button_pressed:return
	var pressed_btn = tool_btn_group.get_pressed_button()
	_batu_grid.visible = false
	_graph_mark.unselect_all_graph_nodes()
	_graph.unselect_all_graph_nodes()
	match pressed_btn.name:
		"Move":
			_mode = TOOLMODE.MOVE
			_graph_mark.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_graph_paint.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_graph.show_scrollbar()
			_graph_mark.hide_scrollbar()
			_graph_paint.hide_scrollbar()
			_subtool_button_single_tile.disabled = false
			_subtool_button_trash.disabled = false
			_subtool_button_auto_tile.disabled = false
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_ARROW
			return
		"MarkMove":
			_mode = TOOLMODE.MARKMOVE
			_graph_mark.mouse_filter = Control.MOUSE_FILTER_STOP
			_graph_paint.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_graph.hide_scrollbar()
			_graph_mark.show_scrollbar()
			_graph_paint.hide_scrollbar()
			_subtool_button_single_tile.disabled = true
			_subtool_button_auto_tile.disabled = true
			_subtool_button_trash.disabled = false
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_ARROW
			return
		"Cursor":
			_mode = TOOLMODE.CURSOR
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Maru":
			_mode = TOOLMODE.MARU
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Batu":
			_mode = TOOLMODE.BATU
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Hoshi":
			_mode = TOOLMODE.HOSHI
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Hoshi2":
			_mode = TOOLMODE.HOSHI2
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Sankaku":
			_mode = TOOLMODE.SANKAKU
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"Keshigomu":
			_mode = TOOLMODE.KESHIGOMU
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		"BatuGrid":
			_mode = TOOLMODE.BATUGRID
			_graph_mark.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
			_batu_grid.visible = true
	
	_graph_paint.mouse_filter = Control.MOUSE_FILTER_STOP
	_graph.hide_scrollbar()
	_graph_mark.hide_scrollbar()
	_graph_paint.show_scrollbar()
	
	_subtool_button_single_tile.disabled = true
	_subtool_button_auto_tile.disabled = true
	_subtool_button_trash.disabled = true

func _on_ButtonSetting_pressed():
	$MarginC_Setting.visible = true
	$MarginC_Setting/PopupDialogSetting.popup()
	$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCAuto_2/ButtonSettingClose.grab_focus()

func _on_PopupDialogSetting_popup_hide():
	$MarginC_Setting.visible = false

func _setting_restore() -> void:
	var fl = File.new()
	if fl.file_exists("res://addons/tontoko_tileset/save.dat"):
		fl.open("res://addons/tontoko_tileset/save.dat",File.READ)
		var data = JSON.parse(fl.get_line()).result
		if data and data.has("cell_size"):
			$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCCell/HBoxCCell/SpinBoxCellSize.get_line_edit().text = data.cell_size
			CellSize = int(data.cell_size)
			HalfCellSize = int(data.cell_size) / 2
			_graph.CellSize = CellSize
			_graph_mark.CellSize = CellSize
		if data and data.has("auto_tile_opt"):
			_opt_tile_type.select(int(data.auto_tile_opt))
		if data and data.has("grid_canvas_px_or_cell"):
			_opt_grid_canvas_px_or_cell.select(int(data.grid_canvas_px_or_cell))
			_on_OptionButtonPxOrCell_item_selected(int(data.grid_canvas_px_or_cell))
		if data and data.has("grid_canvas_size_width") and data.has("grid_canvas_size_width"):
			GridCanvasSize = Vector2(data.grid_canvas_size_width,data.grid_canvas_size_height)
			_spin_grid_canvas_width.value = data.grid_canvas_size_width
			_spin_grid_canvas_width.apply()
			_spin_grid_canvas_height.value = data.grid_canvas_size_height
			_spin_grid_canvas_height.apply()
			_change_grid_canvas_size()
		if data and data.has("grid_canvas_color"):
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCBgColor/ColorPickerButtonGridCanvas.color = Color(String(data.grid_canvas_color))
			_grid_canvas.color = Color(String(data.grid_canvas_color))
		if data and data.has("canvas_size_fit"):
			if data.is_auto_tile == "true":
				_check_canvas_size_fit.pressed = true
			else:
				_check_canvas_size_fit.pressed = false
		fl.close()
		_setting_changed()

func _setting_changed() -> void:
	var fl = File.new()
	var is_auto_tile_str = ""
	if $MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCAuto/HBoxCCell/CheckButtonAuto.pressed:
		is_auto_tile_str = "true"
	else:
		is_auto_tile_str = "false"
	var grid_canvas_size = Vector2.ZERO
	if _opt_grid_canvas_px_or_cell.selected == 0:
		# pixel
		grid_canvas_size = Vector2(_spin_grid_canvas_width.value,_spin_grid_canvas_height.value)
		GridCanvasSize = grid_canvas_size
	else:
		grid_canvas_size = Vector2(_spin_grid_canvas_width.value,_spin_grid_canvas_height.value)
		GridCanvasSize = Vector2(_spin_grid_canvas_width.value * CellSize,_spin_grid_canvas_height.value * CellSize)
	var is_check_canvas_size_fit_str = ""
	if _check_canvas_size_fit.pressed:
		is_check_canvas_size_fit_str = "true"
	else:
		is_check_canvas_size_fit_str = "false"
	var data = {
		cell_size = $MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCCell/HBoxCCell/SpinBoxCellSize.get_line_edit().text,
		is_auto_tile = is_auto_tile_str,
		auto_tile_opt = _opt_tile_type.selected,
		grid_canvas_px_or_cell = _opt_grid_canvas_px_or_cell.selected,
		grid_canvas_size_width = grid_canvas_size.x,
		grid_canvas_size_height = grid_canvas_size.y,
		grid_canvas_color = _grid_canvas.color.to_html(),
		canvas_size_fit = is_check_canvas_size_fit_str
	}
	
	fl.open("res://addons/tontoko_tileset/save.dat",File.WRITE_READ)
	fl.store_line(to_json(data))
	fl.close()

func _on_SpinBoxCellSize_value_changed(value):
	CellSize = value
	HalfCellSize = value / 2
	_graph.CellSize = CellSize
	_graph_mark.CellSize = CellSize
	
	_setting_changed()

func _on_CheckButtonAuto_toggled(button_pressed):
	_opt_tile_type.visible = button_pressed
	IsAutoTile = button_pressed
	_setting_changed()

func _on_ButtonSettingClose_pressed():
	$MarginC_Setting.visible = false
	$MarginC_Setting/PopupDialogSetting.hide()

func _on_OptionButtonWorT_item_selected(_index):
	_setting_changed()

func _on_GridRect_gui_input(event):
	if event is InputEventMouseButton:
		return true
	return false

func _on_Grid_release_drag_rect(start:Vector2,end:Vector2):
	var left:int = 0
	var right:int = 0
	var top:int = 0
	var bottom:int = 0
	if start.x < end.x: # start=l
		left = start.x
		right = end.x
	else:# start=r
		left = end.x
		right = start.x
	if start.y < end.y: # start=t
		top = start.y
		bottom = end.y
	else: # start=b
		top = end.y
		bottom = start.y

	# 矩形選択する
	# Col
	for y in range(top, bottom + 1):
		# row
		for x in range(left, right + 1):
			if _mode == TOOLMODE.KESHIGOMU:
				if _graph_mark.mark_cell_dic.has(Vector2(x,y)):
					_graph_mark.remove_grid_mark(Vector2(x,y))
			else:
				_add_grid_mark(Vector2(x,y))

func _on_Grid_release_drag_rect_right(start:Vector2,end:Vector2):
	var left:int = 0
	var right:int = 0
	var top:int = 0
	var bottom:int = 0
	if start.x < end.x: # start=l
		left = start.x
		right = end.x
	else:# start=r
		left = end.x
		right = start.x
	if start.y < end.y: # start=t
		top = start.y
		bottom = end.y
	else: # start=b
		top = end.y
		bottom = start.y

	# 矩形選択する
	# Col
	for y in range(top, bottom + 1):
		# row
		for x in range(left, right + 1):
			if _graph_mark.mark_cell_dic.has(Vector2(x,y)):
				_graph_mark.remove_grid_mark(Vector2(x,y))

func _on_SpinBoxGridCanvas_value_changed(_value):
	_setting_changed()
	_change_grid_canvas_size()
	
func _change_grid_canvas_size():
	$VBoxC/TabC/Tile/Main/VBoxC/Grid/GraphEditImage/GridCanvas.rect_size = _get_grid_canvas_size()
	_graph.update_canvas()

func _get_grid_canvas_size() -> Vector2:
	if _opt_grid_canvas_px_or_cell.selected == 0:
		return Vector2($VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value,$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value)
	else:
		return Vector2($VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value,$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value) * CellSize

func _on_OptionButtonPxOrCell_item_selected(index):
	if index == 0:
		if TranslationServer.get_locale() == "ja_JP":
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/LabelPxOrCell.text = "px"
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/LabelPxOrCell.text = "px"
		else:
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/LabelPxOrCell.text = "px"
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/LabelPxOrCell.text = "px"
		
		$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value * CellSize
		$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value = $VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value * CellSize
	else:
		if TranslationServer.get_locale() == "ja_JP":
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/LabelPxOrCell.text = "マス"
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/LabelPxOrCell.text = "マス"
		else:
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/LabelPxOrCell.text = translation.text_en_011
			$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/LabelPxOrCell.text = translation.text_en_011
		$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value = int($VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/SpinBoxWidth.value / CellSize)
		$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value = int($VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/SpinBoxHeight.value / CellSize)

func _on_IconPreview_pressed():
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/imageInfo/Preview.visible = !$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/imageInfo/Preview.visible

func _on_AddButton_pressed():
	#TODO
	pass # Replace with function body.

func _on_ButtonRemoveItem_pressed():
	# 選択されたアイテムのみ削除
	var selected_paths = {}
	var selected_items = _item_list.get_selected_items()
	selected_items.invert()
	for selected_item_index in selected_items:
		var tooltip = _item_list.get_item_tooltip(selected_item_index)
		selected_paths[tooltip] = true
		_item_list.remove_item(selected_item_index)
	# 選択されたアイテムと同じ画像パスのものを削除
	for node in _graph.get_children():
		if node.has_meta("image_path"):
			var imagepath = node.get_meta("image_path")
			if selected_paths.has(imagepath):
				_remove_image(node)
	
	_preview_rect.texture = null
	_graph.set_cursor_cell(Vector2.ZERO)
	CanvasMaxY = _graph.get_bottom() + CellSize
	_bottomRightGraphNode.offset.y = CanvasMaxY
	
	_graph.set_cursor_cell(Vector2(0,CanvasMaxY))

func _on_ButtonRemoveAll_pressed():
	
	for node in _graph.get_children():
		if node.has_meta("image_path"):
			_remove_image(node)
	
	_preview_rect.texture = null
	_graph.set_cursor_cell(Vector2.ZERO)
	CanvasMaxY = 0
	_bottomRightGraphNode.offset.y = CanvasMaxY
	
	_graph.set_cursor_cell(Vector2(0,CanvasMaxY))

# -----------------
# 色ピッカー
# -----------------

func _on_ColorPickerButtonGridCanvas_color_changed(color):
	_grid_canvas.color = color
	_setting_changed()

func _on_ColorPickerButtonPaint_color_changed(color):
	_graph_mark.change_color(color)

func _on_ColorPickerButtonGridLine_color_changed(color):
	_graph.add_color_override("grid_major",color)
	_graph.add_color_override("grid_minor",Color(color.r,color.g,color.b, color.a * 0.5))

# -----------------
# Graph Edit
# -----------------

func _on_MoveLock_toggled(button_pressed):
	_graph.is_lock = button_pressed
	_graph_mark.is_lock = button_pressed
	
func _on_SingleTileConcat_pressed():
	# 選択セルをソートする
	var selected_nodes = _graph.get_sorted_selected_1_cell_graph_nodes()
	
	if selected_nodes.size() <= 1: return
	# 矩形☑でマスが飛んでないかチェック TODO

	# format取る用Texture
	var format = selected_nodes[0].get_child(0).texture.get_data().get_format()
	var res_graph_node = GraphNode.new()
	var tex_rect = TextureRect.new()
	var tex = ImageTexture.new()
	var image = Image.new()
	# 結合する	
	var y:int = selected_nodes[0].offset.y
	var row = Image.new()
	for node in selected_nodes:
		if y != node.offset.y:
			# 改行
			image = TontokoImage.concat_image_bottom(image,row)
			row = Image.new()
			y = node.offset.y
		row = TontokoImage.concat_image_right(row,node.get_child(0).texture.get_data())
	image = TontokoImage.concat_image_bottom(image,row)
	tex.create_from_image(image)
	tex_rect.texture = tex
	tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	# GraphNodeの設定
	# メタ情報をつける
	res_graph_node.set_meta("multi_single", "")
	res_graph_node.add_stylebox_override("selectedframe",selected_multi_single_graph_node_stylebox)
	res_graph_node.set_script(graph_node_image_script)
	_graph.add_child(res_graph_node)
	res_graph_node.add_child(tex_rect)
	_graph.move_child(res_graph_node, 2)
	res_graph_node.offset = selected_nodes[0].offset
	
	# 既存のGraphNodeは消す
	for node in _graph.get_selected_graph_nodes():
		_remove_image(node)
	res_graph_node.selected = true

func _on_AutoTileRecog_pressed():
	# 選択セルをソートする
	var selected_nodes = _graph.get_sorted_selected_1_cell_graph_nodes()
	
	if selected_nodes.size() <= 1: return
	
	# タイル大きさ判定する
	var is_3_1_tile = selected_nodes.size() == 3 \
	and (selected_nodes[0].offset.x == selected_nodes[1].offset.x - CellSize) and (selected_nodes[1].offset.x == selected_nodes[2].offset.x - CellSize)\
	and (selected_nodes[0].offset.y == selected_nodes[1].offset.y) and (selected_nodes[1].offset.y == selected_nodes[2].offset.y)\
	
	var is_1_3_tile = selected_nodes.size() == 3 \
	and (selected_nodes[0].offset.x == selected_nodes[1].offset.x) and (selected_nodes[1].offset.x == selected_nodes[2].offset.x)\
	and (selected_nodes[0].offset.y == selected_nodes[1].offset.y - CellSize) and (selected_nodes[1].offset.y == selected_nodes[2].offset.y - CellSize)\

	var is_3_2_tile = selected_nodes.size() == 6 \
	and (selected_nodes[0].offset.x == selected_nodes[1].offset.x - CellSize) and (selected_nodes[1].offset.x == selected_nodes[2].offset.x - CellSize)\
	and (selected_nodes[3].offset.x == selected_nodes[4].offset.x - CellSize) and (selected_nodes[4].offset.x == selected_nodes[5].offset.x - CellSize)\
	and (selected_nodes[0].offset.y == selected_nodes[3].offset.y - CellSize)\
	and (selected_nodes[1].offset.y == selected_nodes[4].offset.y - CellSize)\
	and (selected_nodes[2].offset.y == selected_nodes[5].offset.y - CellSize)
	
	var is_3_3_tile = selected_nodes.size() == 9 \
	and (selected_nodes[0].offset.x == selected_nodes[1].offset.x - CellSize) and (selected_nodes[1].offset.x == selected_nodes[2].offset.x - CellSize)\
	and (selected_nodes[3].offset.x == selected_nodes[4].offset.x - CellSize) and (selected_nodes[4].offset.x == selected_nodes[5].offset.x - CellSize)\
	and (selected_nodes[6].offset.x == selected_nodes[7].offset.x - CellSize) and (selected_nodes[7].offset.x == selected_nodes[8].offset.x - CellSize)\
	and (selected_nodes[0].offset.y == selected_nodes[3].offset.y - CellSize) and (selected_nodes[3].offset.y == selected_nodes[6].offset.y - CellSize)\
	and (selected_nodes[1].offset.y == selected_nodes[4].offset.y - CellSize) and (selected_nodes[4].offset.y == selected_nodes[7].offset.y - CellSize)\
	and (selected_nodes[2].offset.y == selected_nodes[5].offset.y - CellSize) and (selected_nodes[5].offset.y == selected_nodes[8].offset.y - CellSize)
	
	var is_3_3_donut_tile = selected_nodes.size() == 8 \
	and (selected_nodes[0].offset.x == selected_nodes[1].offset.x - CellSize) and (selected_nodes[1].offset.x == selected_nodes[2].offset.x - CellSize)\
	and (selected_nodes[3].offset.x == selected_nodes[4].offset.x - (CellSize * 2))\
	and (selected_nodes[5].offset.x == selected_nodes[6].offset.x - CellSize) and (selected_nodes[6].offset.x == selected_nodes[7].offset.x - CellSize)\
	and (selected_nodes[0].offset.y == selected_nodes[3].offset.y - CellSize) and (selected_nodes[3].offset.y == selected_nodes[5].offset.y - CellSize)\
	and (selected_nodes[1].offset.y == selected_nodes[6].offset.y - (CellSize * 2))\
	and (selected_nodes[2].offset.y == selected_nodes[4].offset.y - CellSize) and (selected_nodes[4].offset.y == selected_nodes[7].offset.y - CellSize)
	
	# format取る用Texture
	var format = selected_nodes[0].get_child(0).texture.get_data().get_format()
	# 3X3となるGraphNodeを作る
	var res_graph_node = GraphNode.new()
	var tex_rect = TextureRect.new()
	var tex = ImageTexture.new()
	var image = Image.new()
	
	var count = 0
	if is_3_1_tile:
		for x in range(0,3):
			image = TontokoImage.concat_image_right(image,selected_nodes[count].get_child(0).texture.get_data())
			count = count + 1
		res_graph_node.set_meta("auto_tile", "3x1")
	elif is_1_3_tile:
		for y in range(0,3):
			image = TontokoImage.concat_image_bottom(image,selected_nodes[count].get_child(0).texture.get_data())
			count = count + 1
		res_graph_node.set_meta("auto_tile", "1x3")
	elif is_3_2_tile:
		for y in range(0,2):
			var row = Image.new()
			for x in range(0,3):
				row = TontokoImage.concat_image_right(row,selected_nodes[count].get_child(0).texture.get_data())
				count = count + 1
			image = TontokoImage.concat_image_bottom(image,row)
		res_graph_node.set_meta("auto_tile", "3x2")
#		print("3*2 finished")
	elif is_3_3_tile:
		# 結合する
		for y in range(0,3):
			var row = Image.new()
			for x in range(0,3):
				row = TontokoImage.concat_image_right(row,selected_nodes[count].get_child(0).texture.get_data())
				count = count + 1
			image = TontokoImage.concat_image_bottom(image,row)
		# メタ情報をつける
		res_graph_node.set_meta("auto_tile", "3x3")
	elif is_3_3_donut_tile:
		# 真ん中に置く透明Imageを作る
		var image_transpa = Image.new()
		image_transpa.create(CellSize,CellSize,false,format)
		
		# 結合する
		for y in range(0,3):
			var row = Image.new()
			for x in range(0,3):
				if x == 1 and y == 1:
					# 穴
					row = TontokoImage.concat_image_right(row,image_transpa)
					count = count - 1
				else:
					row = TontokoImage.concat_image_right(row,selected_nodes[count].get_child(0).texture.get_data())
				count = count + 1
			image = TontokoImage.concat_image_bottom(image,row)
		# メタ情報をつける
		res_graph_node.set_meta("auto_tile", "3x3")
	else:
		_show_error("オートタイルは3*1、1*3、3*2、3*3、3*3真ん中穴のみ対応しています。")
		return
		
	tex.create_from_image(image)
	tex_rect.texture = tex
	tex_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	# GraphNodeの設定
	res_graph_node.add_stylebox_override("selectedframe",selected_auto_tile_graph_node_stylebox)
	res_graph_node.set_script(graph_node_image_script)
	_graph.add_child(res_graph_node)
	res_graph_node.add_child(tex_rect)
	_graph.move_child(res_graph_node, 2)
	res_graph_node.offset = selected_nodes[0].offset
	
	# 既存のGraphNodeは消す
	for node in _graph.get_selected_graph_nodes():
		_remove_image(node)
	res_graph_node.selected = true

func _on_Trash_pressed():
	if _mode == TOOLMODE.MOVE:
		for node in _graph.get_selected_graph_nodes():
			_remove_image(node)
		CanvasMaxY = _graph.get_bottom() + CellSize
		_bottomRightGraphNode.offset.y = CanvasMaxY
	elif _mode == TOOLMODE.MARKMOVE:
		for node in _graph_mark.get_selected_graph_nodes():
			_graph_mark.remove_grid_mark(node.offset / CellSize)

func _remove_image(node:GraphNode) -> void:
	if node is GraphNode and node != _graph_cursor:
		_graph.remove_child(node)

func _on_ButtonExport_pressed():
	var tileset_name = $VBoxC/MarginC/Footer/GridContainer/LineEditTileSetName.text
	var png_name = $VBoxC/MarginC/Footer/GridContainer/LineEditTileSetName_2.text
	
	
	var graph_nodes = _graph.get_all_graph_nodes()
	
	# 出力画像を作成する
	# サイズだけ正しい真っ黒の仮画像を保存する（TileSetの設定に使うので）
	var export_image:Image = Image.new()
	export_image.create(_get_grid_canvas_size().x,_get_grid_canvas_size().y,false,Image.FORMAT_RGBA8)
	
	# Tilesetも作成
	var merged_tileset:TileSet = TileSet.new()
	var file_index:int = 0
	var new_tile_id:int = 0
	# ダミー画像をTileSetのテクスチャの外部リソースとして設定する。（終了後にテキスト置換で変える）
	var ext_resource = load("res://addons/tontoko_tileset/dummy.png")
	
	for node_ in graph_nodes:
		var node:GraphNode = node_
		
		if GridCanvasSize.y <= node.offset.y:
			# 左上から右下なのでYが範囲外なら終了
			break
		if GridCanvasSize.x <= node.offset.x:
			# 左上から右下なのでXが範囲外なら次のマスへ
			continue
		
		var src:Image= node.get_child(0).texture.get_data()
		src.convert(Image.FORMAT_RGBA8)
		export_image.blit_rect(src,Rect2(0,0,src.get_width(),src.get_height()),Vector2(node.offset.x, node.offset.y))
		
		# Tileset
		merged_tileset.create_tile(new_tile_id)
		merged_tileset.tile_set_name(new_tile_id,"tile" + String(new_tile_id))
		merged_tileset.tile_set_texture(new_tile_id,ext_resource)
		merged_tileset.tile_set_modulate(new_tile_id,Color(1,1,1,1))
		merged_tileset.tile_set_region(new_tile_id,Rect2(node.offset,src.get_size()))

		if node.has_meta("auto_tile") and node.get_meta("auto_tile") == "wolf":
			# オートタイルウディタツクール
			merged_tileset.tile_set_tile_mode(new_tile_id,TileSet.AUTO_TILE)
			merged_tileset.autotile_set_bitmask_mode(new_tile_id,TileSet.BITMASK_3X3_MINIMAL)
			for index in range(0,BITMASK_AUTO_TILE_W_AND_T.size()):
				if index % 2 == 0:
					continue
				else:
					merged_tileset.autotile_set_bitmask(new_tile_id,BITMASK_AUTO_TILE_W_AND_T[index - 1],BITMASK_AUTO_TILE_W_AND_T[index])
			merged_tileset.autotile_set_icon_coordinate(new_tile_id,Vector2(5, 7))
			merged_tileset.autotile_set_size(new_tile_id,Vector2(CellSize,CellSize))
			
			var shapes = _edit_painted_tile_autotiles(node.offset,merged_tileset,new_tile_id,src)
			merged_tileset.tile_set_shapes(new_tile_id,shapes)
			
			# LIGHT OCCLUDER TODO
			# subtile_priority TODO RANDOM?
			
		elif node.has_meta("auto_tile") and node.get_meta("auto_tile") != "wolf":
			var auto_tile_meta = node.get_meta("auto_tile")
			merged_tileset.tile_set_tile_mode(new_tile_id,TileSet.AUTO_TILE)
			merged_tileset.autotile_set_bitmask_mode(new_tile_id,TileSet.BITMASK_3X3_MINIMAL)
			var bitmask_array:Array
			match auto_tile_meta:
				"3x1":
					bitmask_array = BITMASK_AUTO_TILE_3X1
				"1x3":
					bitmask_array = BITMASK_AUTO_TILE_1X3
				"3x2":
					bitmask_array = BITMASK_AUTO_TILE_3X2
#				"2x3":
#					bitmask_array = BITMASK_AUTO_TILE_2X3
				"3x3":
					bitmask_array = BITMASK_AUTO_TILE_3X3
					
			for index in range(0,bitmask_array.size()):
				if index % 2 == 0:continue
				merged_tileset.autotile_set_bitmask(new_tile_id,bitmask_array[index - 1],bitmask_array[index])
			# Iconは左上（初期位置）
			
			merged_tileset.autotile_set_size(new_tile_id,Vector2(CellSize,CellSize))
			
			var shapes = _edit_painted_tile_autotiles(node.offset,merged_tileset,new_tile_id,src)
			merged_tileset.tile_set_shapes(new_tile_id,shapes)

		elif node.has_meta("multi_single") and !(src.get_height() == CellSize and src.get_width() == CellSize):
			merged_tileset.tile_set_tile_mode(new_tile_id,TileSet.SINGLE_TILE)
			# Y=一番↓、X=真ん中が塗りセルにする？ TODO
			# とりあえず強制グリッドにする
#			3x3 = -32 -> -(96 / 2) + (32 / 2)  , -64 -> -96 +32
			var vec2_offset = Vector2(-(src.get_width() / 2) + (CellSize / 2), -src.get_height() + CellSize)
			var offset_snaped:Vector2 = _graph.get_forced_grid(vec2_offset)
			merged_tileset.tile_set_texture_offset(new_tile_id,offset_snaped)
#			merged_tileset.autotile_set_icon_coordinate(new_tile_id,vec2_offset / CellSize)
			var shapes = _edit_painted_tile_autotiles(node.offset,merged_tileset,new_tile_id,src)
			# シングルタイルはシェイプ１つでコリジョンとなるので、結合する
			var count = 0
			for shape in shapes:
				# TODO 同Vector2は同インスタンスにしたい
				var point_array:PoolVector2Array = []
				for point in shape.shape.points:
					# 塗ったセルぶんずらす ＋ オフセット分ずらす
					point_array.append(point + (shape.autotile_coord * CellSize))
				var col_shape = ConvexPolygonShape2D.new()
				col_shape.points = point_array
				merged_tileset.tile_set_shape(new_tile_id,count,col_shape)
				merged_tileset.tile_set_shape_offset(new_tile_id,count,offset_snaped)
				count = count + 1
		else:
			#single
			merged_tileset.tile_set_tile_mode(new_tile_id,TileSet.SINGLE_TILE)
#			merged_tileset.autotile_set_icon_coordinate(new_tile_id,Vector2(0, 0))
#			merged_tileset.autotile_set_size(new_tile_id,Vector2(CellSize,CellSize))
			# paint
			_set_painted_1_tile(node.offset,merged_tileset,new_tile_id)
			
#		# 複数セルpaint
#		if !node.has_meta("single"):
#		# 全ますチェック
#			for x in range(node.offset.x / CellSize,(node.offset.x + src.get_width()) / CellSize):
#				for y in range(node.offset.y / CellSize,(node.offset.y + src.get_height()) / CellSize):
#					pass
#		merged_tileset.tile_set_shapes(new_tile_id,org_tileset.tile_get_shapes(org_tile_id))
#		merged_tileset.tile_set_z_index(new_tile_id,org_tileset.tile_get_z_index(org_tile_id))
#		merged_tileset.autotile_set_bitmask_mode(new_tile_id,org_tileset.autotile_get_bitmask_mode(org_tile_id))
#		merged_tileset.autotile_set_spacing(new_tile_id,org_tileset.autotile_get_spacing(org_tile_id))


		
#		merged_tileset.tile_set_occluder_offset(new_tile_id,org_tileset.tile_get_occluder_offset(org_tile_id))
#		merged_tileset.tile_set_light_occluder(new_tile_id,org_tileset.tile_get_light_occluder(org_tile_id))
#		merged_tileset.tile_set_material(new_tile_id,org_tileset.tile_get_material(org_tile_id))
#		merged_tileset.tile_set_normal_map(new_tile_id,org_tileset.tile_get_normal_map(org_tile_id))
#		merged_tileset.tile_set_navigation_polygon(new_tile_id,org_tileset.tile_get_navigation_polygon(org_tile_id))
#		merged_tileset.tile_set_navigation_polygon_offset(new_tile_id,org_tileset.tile_get_navigation_polygon_offset(org_tile_id))
		
		new_tile_id = new_tile_id + 1
	# くっつけた画像を保存する
	export_image.save_png(png_name)
	
	# tres保存→文字列取得→削除→取得した文字列置換→tres(text)作成
	var dir = Directory.new()
	var file = File.new()
	if file.file_exists(tileset_name):
		dir.remove(tileset_name)
	ResourceSaver.save(tileset_name ,merged_tileset,ResourceSaver.FLAG_RELATIVE_PATHS)
	
	# 保存したtresをテキストで開いてダミー画像パスを置換する
	file.open(tileset_name,File.READ)
	var tres_str = file.get_as_text()
	file.close()
	# ファイル削除
	dir.remove(tileset_name)
	
	# tres(text)作成
	file.open(tileset_name,File.WRITE_READ)
	file.store_string(tres_str.replace("res://addons/tontoko_tileset/dummy.png",png_name))
	file.close()
	
func _set_painted_1_tile(offset:Vector2,tileset:TileSet,id:int) -> void:
	var coord = offset / CellSize
	if !_graph_mark.mark_cell_dic.has(coord):
		return
	var graph_node:TextureRect = _graph_mark.mark_cell_dic.get(coord).get_child(0)
	
	if !_graph_mark.mark_cell_dic.has(coord): 
		# 印なしは〇とみなす
		tileset.tile_set_z_index(id,int(_spin_z_index_maru.value))
		return
	var is_contain_batu_grid = graph_node.has_meta("batu_grid")
	match graph_node.get_meta("paint"):
		TOOLMODE.MARU:
			tileset.tile_set_z_index(id,int(_spin_z_index_maru.value))
		TOOLMODE.BATU:
			var col_shape = ConvexPolygonShape2D.new()
			col_shape.points = PoolVector2Array([Vector2(0,0),Vector2(CellSize,0),Vector2(CellSize,CellSize),Vector2(0,CellSize)])
			tileset.tile_set_shape(id,0,col_shape)
			tileset.tile_set_z_index(id,int(_spin_z_index_maru.value))
		TOOLMODE.BATUGRID:
			var shapes = graph_node.get_meta("batu_grid")
			var subtile_count:int = 0
			for shape in shapes:
				if shape.size() == 0:continue
				var col_shape = ConvexPolygonShape2D.new()
				col_shape.points = shape
				tileset.tile_set_shape(id,subtile_count,col_shape)
				subtile_count = subtile_count + 1
			tileset.tile_set_z_index(id,int(_spin_z_index_maru.value))
		TOOLMODE.HOSHI:
			tileset.tile_set_z_index(id,int(_spin_z_index_hoshi.value))
			if is_contain_batu_grid:
				var shapes = graph_node.get_meta("batu_grid")
				var subtile_count:int = 0
				for shape in shapes:
					if shape.size() == 0:continue
					var col_shape = ConvexPolygonShape2D.new()
					col_shape.points = shape
					tileset.tile_set_shape(id,subtile_count,col_shape)
					subtile_count = subtile_count + 1
		TOOLMODE.HOSHI2:
			var col_shape = ConvexPolygonShape2D.new()
			col_shape.points = PoolVector2Array([Vector2(0,0),Vector2(CellSize,0),Vector2(CellSize,CellSize),Vector2(0,CellSize)])
			tileset.tile_set_shape(id,0,col_shape)
			tileset.tile_set_z_index(id,int(_spin_z_index_hoshi2.value))
		TOOLMODE.SANKAKU:
			# 後ろに行くと隠れる ＝ Ysort
			# YsortはTileMapなのでとくになにもしない
			tileset.tile_set_z_index(id,int(_spin_z_index_sankaku.value))
			if is_contain_batu_grid:
				var shapes = graph_node.get_meta("batu_grid")
				var subtile_count:int = 0
				for shape in shapes:
					if shape.size() == 0:continue
					var col_shape = ConvexPolygonShape2D.new()
					col_shape.points = shape
					tileset.tile_set_shape(id,subtile_count,col_shape)
					subtile_count = subtile_count + 1
		_:
			tileset.tile_set_z_index(id,int(_spin_z_index_maru.value))
	
func _edit_painted_tile_autotiles(offset:Vector2,tileset:TileSet,id:int,image:Image) -> Array:
	var row_count = image.get_height() / CellSize
	var col_count = image.get_width() / CellSize
	
	var shapes = []
	var zindexs = []
	
	var col_shape = ConvexPolygonShape2D.new()
	col_shape.points = PoolVector2Array([Vector2(0,0),Vector2(CellSize,0),Vector2(CellSize,CellSize),Vector2(0,CellSize)])
	for y in range(0,row_count):
		for x in range(0,col_count):
			# マーク取得
			# offsetがもっとも左上のマス位置なのでそれにズレ分加算する
			var coord = (offset / CellSize) + Vector2(x,y)
			var paint_tex_rect:TextureRect = _graph_mark.mark_cell_dic.get(coord).get_child(0)
			
			if !_graph_mark.mark_cell_dic.has(coord): 
				# 印なしは〇とみなす
				zindexs.append(Vector3(x,y,_spin_z_index_maru.value))
				continue
			var is_contain_batu_grid = paint_tex_rect.has_meta("batu_grid")
			match paint_tex_rect.get_meta("paint"):
				TOOLMODE.MARU:
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_maru.value))
				TOOLMODE.BATU:
					# 通行不可
					shapes.append({
						"autotile_coord": Vector2(x,y),
						"one_way": false,
						"one_way_margin": 1.0,
						"shape": col_shape,
						})
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_maru.value))
				TOOLMODE.BATUGRID:
					var batu_shapes = paint_tex_rect.get_meta("batu_grid")
					for batu_shape in batu_shapes:
						if batu_shape.size() == 0:continue
						var batu_col_shape = ConvexPolygonShape2D.new()
						batu_col_shape.points = batu_shape
						shapes.append({
						"autotile_coord": Vector2(x,y),
						"one_way": false,
						"one_way_margin": 1.0,
						"shape": batu_col_shape,
						})
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_maru.value))
				TOOLMODE.HOSHI:
					# つねにキャラの上に表示
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_hoshi.value))
					if is_contain_batu_grid:
						var batu_shapes = paint_tex_rect.get_meta("batu_grid")
						for batu_shape in batu_shapes:
							if batu_shape.size() == 0:continue
							var batu_col_shape = ConvexPolygonShape2D.new()
							batu_col_shape.points = batu_shape
							shapes.append({
							"autotile_coord": Vector2(x,y),
							"one_way": false,
							"one_way_margin": 1.0,
							"shape": batu_col_shape,
							})
				TOOLMODE.HOSHI2:
					# つねにキャラの上に表示
					# 通行不可
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_hoshi2.value))
					shapes.append({
						"autotile_coord": Vector2(x,y),
						"one_way": false,
						"one_way_margin": 1.0,
						"shape": col_shape,
						})
				TOOLMODE.SANKAKU:
					# 後ろに行くと隠れる ＝ Ysort
					# YsortはTileMapなのでとくになにもしない
					tileset.autotile_set_z_index(id,Vector2(x,y),int(_spin_z_index_sankaku.value))
					if is_contain_batu_grid:
						var batu_shapes = paint_tex_rect.get_meta("batu_grid")
						for batu_shape in batu_shapes:
							if batu_shape.size() == 0:continue
							var batu_col_shape = ConvexPolygonShape2D.new()
							batu_col_shape.points = batu_shape
							shapes.append({
							"autotile_coord": Vector2(x,y),
							"one_way": false,
							"one_way_margin": 1.0,
							"shape": batu_col_shape,
							})
	return shapes

func _get_all_node(node:Node, array:Array)-> Array:
	for n in node.get_children():
		array.append(n)
		array = _get_all_node(n, array)
	return array

func _on_ItemList_item_selected(index):
	_preview_rect.texture = _item_list.get_item_metadata(index)

func _on_ItemList_multi_selected(index, selected):
	if selected:
		_preview_rect.texture = _item_list.get_item_metadata(index)
		
	for node in _graph.get_children():
		if node is GraphNode:
			node.selected = false
		
	var selected_imagepath = _item_list.get_item_tooltip(index)
	# 選択されたアイテムと同じ画像パスの画像を選択状態にする
	for node in _graph.get_children():
		if node.has_meta("image_path"):
			var imagepath:String = node.get_meta("image_path")
			if selected_imagepath == imagepath:
				node.selected = true

func _show_error(message:String):
	$PopupDialogMessage.popup()
	$PopupDialogMessage/LabelMessage.bbcode_text = tr(message)
	$PopupDialogMessage.popup_exclusive = true
	yield(get_tree().create_timer(0.8),"timeout")
	$PopupDialogMessage.popup_exclusive = false
	yield(get_tree().create_timer(2),"timeout")
	$PopupDialogMessage.hide()


func _on_TabC_tab_changed(tab):
	if tab == 0:
		# Tile
		$VBoxC/TabC/Tile/Main/Images/MarginC.visible = true
#		$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC.visible = true
#		$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC.visible = true
		$VBoxC/MarginC.visible = true
		pass
	elif tab == 1:
		# Help
		$VBoxC/TabC/Tile/Main/Images/MarginC.visible = false
#		$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC.visible = false
#		$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC.visible = false
		$VBoxC/MarginC.visible = false
		pass

var translation = preload("res://addons/tontoko_tileset/translation_en.gd").new()
func translate():
	$Panel/Label.text = translation.text_en_002
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/SelectButton.text = translation.text_en_004
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/CheckBoxCanvasSizeFit.text = translation.text_en_006
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/CheckBoxCanvasSizeFit.hint_tooltip = translation.hint_tooltip_en_001
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/RemoveItemButton.text = translation.text_en_009
	$VBoxC/TabC/Tile/Main/Images/MarginC/VBoxC/RemoveAllItemButton.text = translation.text_en_010
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Move.hint_tooltip = translation.hint_tooltip_en_002
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/MarkMove.hint_tooltip = translation.hint_tooltip_en_003
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Maru.hint_tooltip = translation.hint_tooltip_en_004
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Batu.hint_tooltip = translation.hint_tooltip_en_005
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Hoshi.hint_tooltip = translation.hint_tooltip_en_006
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Hoshi2.hint_tooltip = translation.hint_tooltip_en_007
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Sankaku.hint_tooltip = translation.hint_tooltip_en_008
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/BatuGrid.hint_tooltip = translation.hint_tooltip_en_009
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Keshigomu.hint_tooltip = translation.hint_tooltip_en_010
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC/VBoxC/Cursor.hint_tooltip = translation.hint_tooltip_en_011
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/MoveLock.hint_tooltip = translation.hint_tooltip_en_012
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/SingleTileConcat.hint_tooltip = translation.hint_tooltip_en_013
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/AutoTileRecog.hint_tooltip = translation.hint_tooltip_en_014
	$VBoxC/TabC/Tile/Main/Tools/HBoxC/MC2/VBoxC/Trash.hint_tooltip = translation.hint_tooltip_en_015
	
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC2X2/TL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC2X2/TR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC2X2/BL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC2X2/BR.hint_tooltip = translation.hint_tooltip_en_016
	
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/TL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/TC.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/TR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/CL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/CC.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/CR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/BL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/BC.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC3X3/BR.hint_tooltip = translation.hint_tooltip_en_016
	
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TLBL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TLBR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TLTL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TLTR.hint_tooltip = translation.hint_tooltip_en_016
	
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TRBL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TRBR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TRTL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/TRTR.hint_tooltip = translation.hint_tooltip_en_016
	
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BLBL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BLBR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BLTL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BLTR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BRBL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BRBR.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BRTL.hint_tooltip = translation.hint_tooltip_en_016
	$VBoxC/TabC/Tile/Main/Tools/BatuGrid/GridC4X4/BRTR.hint_tooltip = translation.hint_tooltip_en_016
	
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/Label.text = translation.text_en_012
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/Label.text = translation.text_en_013
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCWidth/LabelPxOrCell.text = translation.text_en_011
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/Label.text = translation.text_en_014
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCHeight/LabelPxOrCell.text = translation.text_en_011
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCPaintColor/Label.text = translation.text_en_015
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCBgColor/Label.text = translation.text_en_016	
	$VBoxC/TabC/Tile/Main/VBoxC/HBoxC/HBoxCGridLineColor/Label.text = translation.text_en_017
	$VBoxC/MarginC/Footer/ButtonSetting.text = translation.text_en_018
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/LabelZIndex.text = translation.text_en_020
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexMaru.hint_tooltip = translation.hint_tooltip_en_017
	
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/LabelZIndex_2.text = translation.text_en_021
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexHoshi.hint_tooltip = translation.hint_tooltip_en_019
	
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/LabelZIndex_3.text = translation.text_en_022
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexSankaku.hint_tooltip = translation.hint_tooltip_en_018
	
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/LabelZIndex_4.text = translation.text_en_023
	$VBoxC/MarginC/Footer/VBoxContainer/GridContainer/SpinBoxZIndexHoshi2.hint_tooltip = translation.hint_tooltip_en_020
	
	$VBoxC/MarginC/Footer/CheckButtonBgExportTransparent.text = translation.text_en_024
	$VBoxC/MarginC/Footer/GridContainer/LabelTileSetName.text = translation.text_en_025
	$VBoxC/MarginC/Footer/GridContainer/LabelTileSetName_2.text = translation.text_en_026
	$VBoxC/MarginC/Footer/PanelC/ButtonExport.text = translation.text_en_027
	$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCSetumei/Label.text = translation.text_en_016
	$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCSetumei2/Label.text = translation.text_en_028
	$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCCell/HBoxCCell/Label.text = translation.text_en_029
	$MarginC_Setting/PopupDialogSetting/VBoxContainer/MarginCAuto_2/ButtonSettingClose.text = translation.text_en_031



