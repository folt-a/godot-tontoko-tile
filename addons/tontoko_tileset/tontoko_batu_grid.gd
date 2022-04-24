tool
extends TabContainer

class_name TontokoBatuGrid

var _tontokoImageScript = preload("res://addons/tontoko_tileset/tontoko_image.gd")
onready var TontokoImage:TontokoImage = _tontokoImageScript.new()

onready var _grid_2x2 = $GridC2X2
onready var _grid_3x3 = $GridC3X3
onready var _grid_4x4 = $GridC4X4

onready var _2_tl = $GridC2X2/TL
onready var _2_tr = $GridC2X2/TR
onready var _2_bl = $GridC2X2/BL
onready var _2_br = $GridC2X2/BR

onready var _3_tl = $GridC3X3/TL
onready var _3_tc = $GridC3X3/TC
onready var _3_tr = $GridC3X3/TR
onready var _3_cl = $GridC3X3/CL
onready var _3_cc = $GridC3X3/CC
onready var _3_cr = $GridC3X3/CR
onready var _3_bl = $GridC3X3/BL
onready var _3_bc = $GridC3X3/BC
onready var _3_br = $GridC3X3/BR

onready var _4_tltl = $GridC4X4/TLTL
onready var _4_tltr = $GridC4X4/TLTR
onready var _4_tlbl = $GridC4X4/TLBL
onready var _4_tlbr = $GridC4X4/TLBR
onready var _4_trtl = $GridC4X4/TRTL
onready var _4_trtr = $GridC4X4/TRTR
onready var _4_trbl = $GridC4X4/TRBL
onready var _4_trbr = $GridC4X4/TRBR
onready var _4_bltl = $GridC4X4/BLTL
onready var _4_bltr = $GridC4X4/BLTR
onready var _4_blbl = $GridC4X4/BLBL
onready var _4_blbr = $GridC4X4/BLBR
onready var _4_brtl = $GridC4X4/BRTL
onready var _4_brtr = $GridC4X4/BRTR
onready var _4_brbl = $GridC4X4/BRBL
onready var _4_brbr = $GridC4X4/BRBR

var _selected_grids = []
var icon:ImageTexture = ImageTexture.new()

var CellSize = 32

func _ready():
	set_tab_title(0,"2")
	set_tab_title(1,"3")
	set_tab_title(2,"4")
	
	# All Buttons Connect
	for grid in get_children():
		for btn in grid.get_children():
			btn.connect("toggled",self,"_on_batu_toggled")

func update_selects() -> void:
	_selected_grids.clear()
	match current_tab:
		0:
			#2x2
			var sub_size = CellSize/2
			_selected_grids.append(_2_tl.get_shape(CellSize,sub_size))
			_selected_grids.append(_2_tr.get_shape(CellSize,sub_size))
			_selected_grids.append(_2_bl.get_shape(CellSize,sub_size))
			_selected_grids.append(_2_br.get_shape(CellSize,sub_size))
		1:
			#3x3
			var sub_size = CellSize/3
			_selected_grids.append(_3_tl.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_tc.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_tr.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_cl.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_cc.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_cr.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_bl.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_bc.get_shape(CellSize,sub_size))
			_selected_grids.append(_3_br.get_shape(CellSize,sub_size))
		2:
			#4x4
			var sub_size = CellSize/4
			_selected_grids.append(_4_tltl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_tltr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_trtl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_trtr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_tlbl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_tlbr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_trbl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_trbr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_bltl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_bltr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_brtl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_brtr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_blbl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_blbr.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_brbl.get_shape(CellSize,sub_size))
			_selected_grids.append(_4_brbr.get_shape(CellSize,sub_size))
	update_image()
#	print(_selected_grids)
	
func update_image() -> void:
	# image 更新
	var icon_image = Image.new()
	match current_tab:
		0:
		#2x2
			var row1:Image = TontokoImage.concat_image_right(_2_tl.get_icon_image(),_2_tr.get_icon_image())
			var row2:Image = TontokoImage.concat_image_right(_2_bl.get_icon_image(),_2_br.get_icon_image())
			icon_image = TontokoImage.concat_image_bottom(row1,row2)
		1:
			#3x3
			var row1:Image = TontokoImage.concat_image_right(_3_tl.get_icon_image(),_3_tc.get_icon_image())
			row1 = TontokoImage.concat_image_right(row1,_3_tr.get_icon_image())
			var row2:Image = TontokoImage.concat_image_right(_3_cl.get_icon_image(),_3_cc.get_icon_image())
			row2 = TontokoImage.concat_image_right(row2,_3_cr.get_icon_image())
			var row3:Image = TontokoImage.concat_image_right(_3_bl.get_icon_image(),_3_bc.get_icon_image())
			row3 = TontokoImage.concat_image_right(row3,_3_br.get_icon_image())
			icon_image = TontokoImage.concat_image_bottom(row1,row2)
			icon_image = TontokoImage.concat_image_bottom(icon_image,row3)
		2:
			#4x4
			var row1:Image = TontokoImage.concat_image_right(_4_tltl.get_icon_image(),_4_tltr.get_icon_image())
			row1 = TontokoImage.concat_image_right(row1,_4_trtl.get_icon_image())
			row1 = TontokoImage.concat_image_right(row1,_4_trtr.get_icon_image())
			var row2:Image = TontokoImage.concat_image_right(_4_tlbl.get_icon_image(),_4_tlbr.get_icon_image())
			row2 = TontokoImage.concat_image_right(row2,_4_trbl.get_icon_image())
			row2 = TontokoImage.concat_image_right(row2,_4_trbr.get_icon_image())
			var row3:Image = TontokoImage.concat_image_right(_4_bltl.get_icon_image(),_4_bltr.get_icon_image())
			row3 = TontokoImage.concat_image_right(row3,_4_brtl.get_icon_image())
			row3 = TontokoImage.concat_image_right(row3,_4_brtr.get_icon_image())
			var row4:Image = TontokoImage.concat_image_right(_4_blbl.get_icon_image(),_4_blbr.get_icon_image())
			row4 = TontokoImage.concat_image_right(row4,_4_brbl.get_icon_image())
			row4 = TontokoImage.concat_image_right(row4,_4_brbr.get_icon_image())
			icon_image = TontokoImage.concat_image_bottom(row1,row2)
			icon_image = TontokoImage.concat_image_bottom(icon_image,row3)
			icon_image = TontokoImage.concat_image_bottom(icon_image,row4)
	icon.create_from_image(icon_image)

func _on_batu_toggled(_button_pressed) -> void:
	call_deferred("update_selects")


func _on_BatuGrid_tab_changed(tab):
	call_deferred("update_selects")
