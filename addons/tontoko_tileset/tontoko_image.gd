extends Object

class_name TontokoImage

var CellSize:int = 32
var HalfCellSize:int = 16
#var GridCanvasSize:Vector2 = Vector2.ZERO
#var CanvasMaxY = 0

func conv_wolf(tex:Texture) -> Image:
	if tex == null:return null
	# ウディタタイプ
	var i1a_at = AtlasTexture.new()
	var i1b_at = AtlasTexture.new()
	var i1c_at = AtlasTexture.new()
	var i1d_at = AtlasTexture.new()
	var i2a_at = AtlasTexture.new()
	var i2b_at = AtlasTexture.new()
	var i2c_at = AtlasTexture.new()
	var i2d_at = AtlasTexture.new()
	var i3a_at = AtlasTexture.new()
	var i3b_at = AtlasTexture.new()
	var i3c_at = AtlasTexture.new()
	var i3d_at = AtlasTexture.new()
	var i4a_at = AtlasTexture.new()
	var i4b_at = AtlasTexture.new()
	var i4c_at = AtlasTexture.new()
	var i4d_at = AtlasTexture.new()
	var i5a_at = AtlasTexture.new()
	var i5b_at = AtlasTexture.new()
	var i5c_at = AtlasTexture.new()
	var i5d_at = AtlasTexture.new()
	i1a_at.atlas = tex
	i1b_at.atlas = tex
	i1c_at.atlas = tex
	i1d_at.atlas = tex
	i2a_at.atlas = tex
	i2b_at.atlas = tex
	i2c_at.atlas = tex
	i2d_at.atlas = tex
	i3a_at.atlas = tex
	i3b_at.atlas = tex
	i3c_at.atlas = tex
	i3d_at.atlas = tex
	i4a_at.atlas = tex
	i4b_at.atlas = tex
	i4c_at.atlas = tex
	i4d_at.atlas = tex
	i5a_at.atlas = tex
	i5b_at.atlas = tex
	i5c_at.atlas = tex
	i5d_at.atlas = tex
	# 1 = 島
	# 1A 1B
	# 1C 1D
	i1a_at.region = Rect2(0,0,HalfCellSize,HalfCellSize)
	i1b_at.region = Rect2(HalfCellSize,0,HalfCellSize,HalfCellSize)
	i1c_at.region = Rect2(0,HalfCellSize,HalfCellSize,HalfCellSize)
	i1d_at.region = Rect2(HalfCellSize,HalfCellSize,HalfCellSize,HalfCellSize)
	# 2 = 左右
	# 2A 2B
	# 2C 2D
	i2a_at.region = Rect2(0,0 + CellSize,HalfCellSize,HalfCellSize)
	i2b_at.region = Rect2(HalfCellSize,0 + CellSize,HalfCellSize,HalfCellSize)
	i2c_at.region = Rect2(0,HalfCellSize + CellSize,HalfCellSize,HalfCellSize)
	i2d_at.region = Rect2(HalfCellSize,HalfCellSize + CellSize,HalfCellSize,HalfCellSize)
	# 3 = 上下
	# 3A 3B
	# 3C 3D
	i3a_at.region = Rect2(0,0 + (CellSize * 2),HalfCellSize,HalfCellSize)
	i3b_at.region = Rect2(HalfCellSize,0 + (CellSize * 2),HalfCellSize,HalfCellSize)
	i3c_at.region = Rect2(0,HalfCellSize + (CellSize * 2),HalfCellSize,HalfCellSize)
	i3d_at.region = Rect2(HalfCellSize,HalfCellSize + (CellSize * 2),HalfCellSize,HalfCellSize)
	# 4 = 4つ角
	# 4A 4B
	# 4C 4D
	i4a_at.region = Rect2(0,0 + (CellSize * 3),HalfCellSize,HalfCellSize)
	i4b_at.region = Rect2(HalfCellSize,0 + (CellSize * 3),HalfCellSize,HalfCellSize)
	i4c_at.region = Rect2(0,HalfCellSize + (CellSize * 3),HalfCellSize,HalfCellSize)
	i4d_at.region = Rect2(HalfCellSize,HalfCellSize + (CellSize * 3),HalfCellSize,HalfCellSize)
	# 5 = 全面
	# 5A 5B
	# 5C 5D
	i5a_at.region = Rect2(0,0 + (CellSize * 4),HalfCellSize,HalfCellSize)
	i5b_at.region = Rect2(HalfCellSize,0 + (CellSize * 4),HalfCellSize,HalfCellSize)
	i5c_at.region = Rect2(0,HalfCellSize + (CellSize * 4),HalfCellSize,HalfCellSize)
	i5d_at.region = Rect2(HalfCellSize,HalfCellSize + (CellSize * 4),HalfCellSize,HalfCellSize)
	
	var i1a:Image = i1a_at.get_data()
	var i1b:Image = i1b_at.get_data()
	var i1c:Image = i1c_at.get_data()
	var i1d:Image = i1d_at.get_data()
	var i2a:Image = i2a_at.get_data()
	var i2b:Image = i2b_at.get_data()
	var i2c:Image = i2c_at.get_data()
	var i2d:Image = i2d_at.get_data()
	var i3a:Image = i3a_at.get_data()
	var i3b:Image = i3b_at.get_data()
	var i3c:Image = i3c_at.get_data()
	var i3d:Image = i3d_at.get_data()
	var i4a:Image = i4a_at.get_data()
	var i4b:Image = i4b_at.get_data()
	var i4c:Image = i4c_at.get_data()
	var i4d:Image = i4d_at.get_data()
	var i5a:Image = i5a_at.get_data()
	var i5b:Image = i5b_at.get_data()
	var i5c:Image = i5c_at.get_data()
	var i5d:Image = i5d_at.get_data()
	# ↓↓↓↓↓
	
	# 5A 5B   4A 5B   5A 4b   4a 4b   5A 5B   4A 5B
	# 5C 5D   5C 5D   5c 5d   5c 5d   5c 4d   5c 4d
	var row1_1:Image = concat_image_right(i5a,i5b)
	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i5b)

	row1_1 = concat_image_right(row1_1,i5a)
	row1_1 = concat_image_right(row1_1,i4b)

	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i4b)

	row1_1 = concat_image_right(row1_1,i5a)
	row1_1 = concat_image_right(row1_1,i5b)

	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i5b)
	var row1_2:Image = concat_image_right(i5c,i5d)
	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i4d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i4d)

	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5A 4B   4A 4B   5A 5B   4A 5B   5A 4B   4A 4B
	# 5c 4d   5c 4d   4c 5d   4c 5d   4c 5d   4c 5d
	var row2_1:Image = concat_image_right(i5a,i4b)
	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i4b)

	row2_1 = concat_image_right(row2_1,i5a)
	row2_1 = concat_image_right(row2_1,i5b)

	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i5b)

	row2_1 = concat_image_right(row2_1,i5a)
	row2_1 = concat_image_right(row2_1,i4b)

	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i4b)
	var row2_2:Image = concat_image_right(i5c,i4d)
	row2_2 = concat_image_right(row2_2,i5c)
	row2_2 = concat_image_right(row2_2,i4d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)
	
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 5b   4a 5b   5a 4b   4a 4b   2a 5b   2a 4b
	# 4c 4d   4c 4d   4c 4d   4c 4d   2c 5d   2c 5d
	var row3_1:Image = concat_image_right(i5a,i5b)
	row3_1 = concat_image_right(row3_1,i4a)
	row3_1 = concat_image_right(row3_1,i5b)

	row3_1 = concat_image_right(row3_1,i5a)
	row3_1 = concat_image_right(row3_1,i4b)

	row3_1 = concat_image_right(row3_1,i4a)
	row3_1 = concat_image_right(row3_1,i4b)

	row3_1 = concat_image_right(row3_1,i2a)
	row3_1 = concat_image_right(row3_1,i5b)

	row3_1 = concat_image_right(row3_1,i2a)
	row3_1 = concat_image_right(row3_1,i4b)
	var row3_2:Image = concat_image_right(i4c,i4d)
	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i2c)
	row3_2 = concat_image_right(row3_2,i5d)

	row3_2 = concat_image_right(row3_2,i2c)
	row3_2 = concat_image_right(row3_2,i5d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 2a 5b   2a 4b   3a 3b   3a 3b   3a 3b   3a 3b
	# 2c 4d   2c 4d   5c 4d   5c 5d   4c 5d   4c 4d
	var row4_1:Image = concat_image_right(i2a,i5b)
	row4_1 = concat_image_right(row4_1,i2a)
	row4_1 = concat_image_right(row4_1,i4b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)
	var row4_2:Image = concat_image_right(i2c,i4d)
	row4_2 = concat_image_right(row4_2,i2c)
	row4_2 = concat_image_right(row4_2,i4d)

	row4_2 = concat_image_right(row4_2,i5c)
	row4_2 = concat_image_right(row4_2,i5d)

	row4_2 = concat_image_right(row4_2,i5c)
	row4_2 = concat_image_right(row4_2,i4d)

	row4_2 = concat_image_right(row4_2,i4c)
	row4_2 = concat_image_right(row4_2,i5d)

	row4_2 = concat_image_right(row4_2,i4c)
	row4_2 = concat_image_right(row4_2,i4d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 2b   5a 2b   4a 2b   4a 2b   5a 5b   4a 5b
	# 5c 2d   4c 2d   5c 2d   4c 2d   3c 3d   3c 3d
	var row5_1:Image = concat_image_right(i5a,i2b)
	row5_1 = concat_image_right(row5_1,i5a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i5a)
	row5_1 = concat_image_right(row5_1,i5b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i5b)
	var row5_2:Image = concat_image_right(i5c,i2d)
	row5_2 = concat_image_right(row5_2,i4c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i5c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i4c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i3c)
	row5_2 = concat_image_right(row5_2,i3d)

	row5_2 = concat_image_right(row5_2,i3c)
	row5_2 = concat_image_right(row5_2,i3d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 4b   4a 4b   2a 2b   3a 3b   1a 3b   1a 3b
	# 3c 3d   3c 3d   2c 2d   3c 3d   2c 5d   2c 4d
	var row6_1:Image = concat_image_right(i5a,i4b)
	row6_1 = concat_image_right(row6_1,i4a)
	row6_1 = concat_image_right(row6_1,i4b)

	row6_1 = concat_image_right(row6_1,i2a)
	row6_1 = concat_image_right(row6_1,i2b)

	row6_1 = concat_image_right(row6_1,i3a)
	row6_1 = concat_image_right(row6_1,i3b)

	row6_1 = concat_image_right(row6_1,i1a)
	row6_1 = concat_image_right(row6_1,i3b)

	row6_1 = concat_image_right(row6_1,i1a)
	row6_1 = concat_image_right(row6_1,i3b)
	var row6_2:Image = concat_image_right(i3c,i3d)
	row6_2 = concat_image_right(row6_2,i3c)
	row6_2 = concat_image_right(row6_2,i3d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i2d)

	row6_2 = concat_image_right(row6_2,i3c)
	row6_2 = concat_image_right(row6_2,i3d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i5d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i4d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 3a 1b   3a 1b   5a 2b   4a 2b   2b 5b   2b 4b
	# 5c 2d   4c 2d   3c 1d   3c 1d   1c 3d   1c 3d
	var row7_1:Image = concat_image_right(i3a,i1b)
	row7_1 = concat_image_right(row7_1,i3a)
	row7_1 = concat_image_right(row7_1,i1b)

	row7_1 = concat_image_right(row7_1,i5a)
	row7_1 = concat_image_right(row7_1,i2b)

	row7_1 = concat_image_right(row7_1,i4a)
	row7_1 = concat_image_right(row7_1,i2b)

	row7_1 = concat_image_right(row7_1,i2a)
	row7_1 = concat_image_right(row7_1,i5b)

	row7_1 = concat_image_right(row7_1,i2a)
	row7_1 = concat_image_right(row7_1,i4b)
	var row7_2:Image = concat_image_right(i5c,i2d)
	row7_2 = concat_image_right(row7_2,i4c)
	row7_2 = concat_image_right(row7_2,i2d)

	row7_2 = concat_image_right(row7_2,i3c)
	row7_2 = concat_image_right(row7_2,i1d)

	row7_2 = concat_image_right(row7_2,i3c)
	row7_2 = concat_image_right(row7_2,i1d)

	row7_2 = concat_image_right(row7_2,i1c)
	row7_2 = concat_image_right(row7_2,i3d)

	row7_2 = concat_image_right(row7_2,i1c)
	row7_2 = concat_image_right(row7_2,i3d)	
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 1a 1b   1a 3b   2a 2b   3a 1b   1a 1b   1a 1b
	# 2c 2d   1c 3d   1c 1d   3c 1d   1c 1d   1c 1d
	var row8_1:Image = concat_image_right(i1a,i1b)
	row8_1 = concat_image_right(row8_1,i1a)
	row8_1 = concat_image_right(row8_1,i3b)

	row8_1 = concat_image_right(row8_1,i2a)
	row8_1 = concat_image_right(row8_1,i2b)

	row8_1 = concat_image_right(row8_1,i3a)
	row8_1 = concat_image_right(row8_1,i1b)

	row8_1 = concat_image_right(row8_1,i1a)
	row8_1 = concat_image_right(row8_1,i1b)

	row8_1 = concat_image_right(row8_1,i1a)
	row8_1 = concat_image_right(row8_1,i1b)
	var row8_2:Image = concat_image_right(i2c,i2d)
	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i3d)

	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i3c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i1d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --

	var final:Image = concat_image_bottom(row1_1,row1_2)
	final = concat_image_bottom(final,row2_1)
	final = concat_image_bottom(final,row2_2)
	final = concat_image_bottom(final,row3_1)
	final = concat_image_bottom(final,row3_2)
	final = concat_image_bottom(final,row4_1)
	final = concat_image_bottom(final,row4_2)
	final = concat_image_bottom(final,row5_1)
	final = concat_image_bottom(final,row5_2)
	final = concat_image_bottom(final,row6_1)
	final = concat_image_bottom(final,row6_2)
	final = concat_image_bottom(final,row7_1)
	final = concat_image_bottom(final,row7_2)
	final = concat_image_bottom(final,row8_1)
	final = concat_image_bottom(final,row8_2)
	
	return final

func conv_maker(tex:Texture) -> Image:
	if tex == null:return null
		# ウディタタイプ
	var i1a_at = AtlasTexture.new()
	var i1b_at = AtlasTexture.new()
	var i1c_at = AtlasTexture.new()
	var i1d_at = AtlasTexture.new()
	var i2a_at = AtlasTexture.new()
	var i2b_at = AtlasTexture.new()
	var i2c_at = AtlasTexture.new()
	var i2d_at = AtlasTexture.new()
	var i3a_at = AtlasTexture.new()
	var i3b_at = AtlasTexture.new()
	var i3c_at = AtlasTexture.new()
	var i3d_at = AtlasTexture.new()
	var i4a_at = AtlasTexture.new()
	var i4b_at = AtlasTexture.new()
	var i4c_at = AtlasTexture.new()
	var i4d_at = AtlasTexture.new()
	var i5a_at = AtlasTexture.new()
	var i5b_at = AtlasTexture.new()
	var i5c_at = AtlasTexture.new()
	var i5d_at = AtlasTexture.new()
	var i6a_at = AtlasTexture.new()
	var i6b_at = AtlasTexture.new()
	var i6c_at = AtlasTexture.new()
	var i6d_at = AtlasTexture.new()
	i1a_at.atlas = tex
	i1b_at.atlas = tex
	i1c_at.atlas = tex
	i1d_at.atlas = tex
	i2a_at.atlas = tex
	i2b_at.atlas = tex
	i2c_at.atlas = tex
	i2d_at.atlas = tex
	i3a_at.atlas = tex
	i3b_at.atlas = tex
	i3c_at.atlas = tex
	i3d_at.atlas = tex
	i4a_at.atlas = tex
	i4b_at.atlas = tex
	i4c_at.atlas = tex
	i4d_at.atlas = tex
	i5a_at.atlas = tex
	i5b_at.atlas = tex
	i5c_at.atlas = tex
	i5d_at.atlas = tex
	i6a_at.atlas = tex
	i6b_at.atlas = tex
	i6c_at.atlas = tex
	i6d_at.atlas = tex
	# 1 = 島
	# 1A 1B
	# 1C 1D
	i1a_at.region = Rect2(0,HalfCellSize*2,HalfCellSize,HalfCellSize)#0,2
	i1b_at.region = Rect2(HalfCellSize*3,HalfCellSize*2,HalfCellSize,HalfCellSize)#3,2
	i1c_at.region = Rect2(0,HalfCellSize*5,HalfCellSize,HalfCellSize)#0,5
	i1d_at.region = Rect2(HalfCellSize*3,HalfCellSize*5,HalfCellSize,HalfCellSize)#3,5
	# 2 = 左右
	# 2A 2B
	# 2C 2D
	i2a_at.region = Rect2(0,HalfCellSize*4,HalfCellSize,HalfCellSize)#0,4
	i2b_at.region = Rect2(HalfCellSize*3,HalfCellSize*4,HalfCellSize,HalfCellSize)#3,3
	i2c_at.region = Rect2(0,HalfCellSize*3,HalfCellSize,HalfCellSize)#0,3
	i2d_at.region = Rect2(HalfCellSize*3,HalfCellSize*3,HalfCellSize,HalfCellSize)#3,4
	# 3 = 上下
	# 3A 3B
	# 3C 3D
	i3a_at.region = Rect2(HalfCellSize*2,HalfCellSize*2,HalfCellSize,HalfCellSize)#2,2
	i3b_at.region = Rect2(HalfCellSize,HalfCellSize*2,HalfCellSize,HalfCellSize)#1,2
	i3c_at.region = Rect2(HalfCellSize*2,HalfCellSize*5,HalfCellSize,HalfCellSize)#2,5
	i3d_at.region = Rect2(HalfCellSize,HalfCellSize*5,HalfCellSize,HalfCellSize)#1,5
	# 4 = 4つ角
	# 4A 4B
	# 4C 4D
	i4a_at.region = Rect2(HalfCellSize*2,0,HalfCellSize,HalfCellSize)#2,0x
	i4b_at.region = Rect2(HalfCellSize*3,0,HalfCellSize,HalfCellSize)#3,0
	i4c_at.region = Rect2(HalfCellSize*2,HalfCellSize,HalfCellSize,HalfCellSize)#2,1
	i4d_at.region = Rect2(HalfCellSize*3,HalfCellSize,HalfCellSize,HalfCellSize)#3,1
	# 5 = 全面
	# 5A 5B
	# 5C 5D
	i5a_at.region = Rect2(HalfCellSize,HalfCellSize*3,HalfCellSize,HalfCellSize)#1,3
	i5b_at.region = Rect2(HalfCellSize*2,HalfCellSize*3,HalfCellSize,HalfCellSize)#2,3
	i5c_at.region = Rect2(HalfCellSize,HalfCellSize*4,HalfCellSize,HalfCellSize)#1,4
	i5d_at.region = Rect2(HalfCellSize*2,HalfCellSize*4,HalfCellSize,HalfCellSize)#2,4

	# 6 = サムネ用
	i6a_at.region = Rect2(0,0,HalfCellSize,HalfCellSize)#0,0
	i6b_at.region = Rect2(0,HalfCellSize,HalfCellSize,HalfCellSize)#0,1
	i6c_at.region = Rect2(HalfCellSize,0,HalfCellSize,HalfCellSize)#1,0
	i6d_at.region = Rect2(HalfCellSize,HalfCellSize,HalfCellSize,HalfCellSize)#1,1
	
	var i1a:Image = i1a_at.get_data()
	var i1b:Image = i1b_at.get_data()
	var i1c:Image = i1c_at.get_data()
	var i1d:Image = i1d_at.get_data()
	var i2a:Image = i2a_at.get_data()
	var i2b:Image = i2b_at.get_data()
	var i2c:Image = i2c_at.get_data()
	var i2d:Image = i2d_at.get_data()
	var i3a:Image = i3a_at.get_data()
	var i3b:Image = i3b_at.get_data()
	var i3c:Image = i3c_at.get_data()
	var i3d:Image = i3d_at.get_data()
	var i4a:Image = i4a_at.get_data()
	var i4b:Image = i4b_at.get_data()
	var i4c:Image = i4c_at.get_data()
	var i4d:Image = i4d_at.get_data()
	var i5a:Image = i5a_at.get_data()
	var i5b:Image = i5b_at.get_data()
	var i5c:Image = i5c_at.get_data()
	var i5d:Image = i5d_at.get_data()
	var i6a:Image = i5a_at.get_data()
	var i6b:Image = i5b_at.get_data()
	var i6c:Image = i5c_at.get_data()
	var i6d:Image = i5d_at.get_data()
	# ↓↓↓↓↓
	
	# 5A 5B   4A 5B   5A 4b   4a 4b   5A 5B   4A 5B
	# 5C 5D   5C 5D   5c 5d   5c 5d   5c 4d   5c 4d
	var row1_1:Image = concat_image_right(i5a,i5b)
	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i5b)

	row1_1 = concat_image_right(row1_1,i5a)
	row1_1 = concat_image_right(row1_1,i4b)

	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i4b)

	row1_1 = concat_image_right(row1_1,i5a)
	row1_1 = concat_image_right(row1_1,i5b)

	row1_1 = concat_image_right(row1_1,i4a)
	row1_1 = concat_image_right(row1_1,i5b)
	var row1_2:Image = concat_image_right(i5c,i5d)
	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i5d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i4d)

	row1_2 = concat_image_right(row1_2,i5c)
	row1_2 = concat_image_right(row1_2,i4d)

	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5A 4B   4A 4B   5A 5B   4A 5B   5A 4B   4A 4B
	# 5c 4d   5c 4d   4c 5d   4c 5d   4c 5d   4c 5d
	var row2_1:Image = concat_image_right(i5a,i4b)
	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i4b)

	row2_1 = concat_image_right(row2_1,i5a)
	row2_1 = concat_image_right(row2_1,i5b)

	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i5b)

	row2_1 = concat_image_right(row2_1,i5a)
	row2_1 = concat_image_right(row2_1,i4b)

	row2_1 = concat_image_right(row2_1,i4a)
	row2_1 = concat_image_right(row2_1,i4b)
	var row2_2:Image = concat_image_right(i5c,i4d)
	row2_2 = concat_image_right(row2_2,i5c)
	row2_2 = concat_image_right(row2_2,i4d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)

	row2_2 = concat_image_right(row2_2,i4c)
	row2_2 = concat_image_right(row2_2,i5d)
	
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 5b   4a 5b   5a 4b   4a 4b   2a 5b   2a 4b
	# 4c 4d   4c 4d   4c 4d   4c 4d   2c 5d   2c 5d
	var row3_1:Image = concat_image_right(i5a,i5b)
	row3_1 = concat_image_right(row3_1,i4a)
	row3_1 = concat_image_right(row3_1,i5b)

	row3_1 = concat_image_right(row3_1,i5a)
	row3_1 = concat_image_right(row3_1,i4b)

	row3_1 = concat_image_right(row3_1,i4a)
	row3_1 = concat_image_right(row3_1,i4b)

	row3_1 = concat_image_right(row3_1,i2a)
	row3_1 = concat_image_right(row3_1,i5b)

	row3_1 = concat_image_right(row3_1,i2a)
	row3_1 = concat_image_right(row3_1,i4b)
	var row3_2:Image = concat_image_right(i4c,i4d)
	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i4c)
	row3_2 = concat_image_right(row3_2,i4d)

	row3_2 = concat_image_right(row3_2,i2c)
	row3_2 = concat_image_right(row3_2,i5d)

	row3_2 = concat_image_right(row3_2,i2c)
	row3_2 = concat_image_right(row3_2,i5d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 2a 5b   2a 4b   3a 3b   3a 3b   3a 3b   3a 3b
	# 2c 4d   2c 4d   5c 4d   5c 5d   4c 5d   4c 4d
	var row4_1:Image = concat_image_right(i2a,i5b)
	row4_1 = concat_image_right(row4_1,i2a)
	row4_1 = concat_image_right(row4_1,i4b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)

	row4_1 = concat_image_right(row4_1,i3a)
	row4_1 = concat_image_right(row4_1,i3b)
	var row4_2:Image = concat_image_right(i2c,i4d)
	row4_2 = concat_image_right(row4_2,i2c)
	row4_2 = concat_image_right(row4_2,i4d)

	row4_2 = concat_image_right(row4_2,i5c)
	row4_2 = concat_image_right(row4_2,i5d)

	row4_2 = concat_image_right(row4_2,i5c)
	row4_2 = concat_image_right(row4_2,i4d)

	row4_2 = concat_image_right(row4_2,i4c)
	row4_2 = concat_image_right(row4_2,i5d)

	row4_2 = concat_image_right(row4_2,i4c)
	row4_2 = concat_image_right(row4_2,i4d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 2b   5a 2b   4a 2b   4a 2b   5a 5b   4a 5b
	# 5c 2d   4c 2d   5c 2d   4c 2d   3c 3d   3c 3d
	var row5_1:Image = concat_image_right(i5a,i2b)
	row5_1 = concat_image_right(row5_1,i5a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i2b)

	row5_1 = concat_image_right(row5_1,i5a)
	row5_1 = concat_image_right(row5_1,i5b)

	row5_1 = concat_image_right(row5_1,i4a)
	row5_1 = concat_image_right(row5_1,i5b)
	var row5_2:Image = concat_image_right(i5c,i2d)
	row5_2 = concat_image_right(row5_2,i4c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i5c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i4c)
	row5_2 = concat_image_right(row5_2,i2d)

	row5_2 = concat_image_right(row5_2,i3c)
	row5_2 = concat_image_right(row5_2,i3d)

	row5_2 = concat_image_right(row5_2,i3c)
	row5_2 = concat_image_right(row5_2,i3d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 5a 4b   4a 4b   2a 2b   3a 3b   1a 3b   1a 3b
	# 3c 3d   3c 3d   2c 2d   3c 3d   2c 5d   2c 4d
	var row6_1:Image = concat_image_right(i5a,i4b)
	row6_1 = concat_image_right(row6_1,i4a)
	row6_1 = concat_image_right(row6_1,i4b)

	row6_1 = concat_image_right(row6_1,i2a)
	row6_1 = concat_image_right(row6_1,i2b)

	row6_1 = concat_image_right(row6_1,i3a)
	row6_1 = concat_image_right(row6_1,i3b)

	row6_1 = concat_image_right(row6_1,i1a)
	row6_1 = concat_image_right(row6_1,i3b)

	row6_1 = concat_image_right(row6_1,i1a)
	row6_1 = concat_image_right(row6_1,i3b)
	var row6_2:Image = concat_image_right(i3c,i3d)
	row6_2 = concat_image_right(row6_2,i3c)
	row6_2 = concat_image_right(row6_2,i3d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i2d)

	row6_2 = concat_image_right(row6_2,i3c)
	row6_2 = concat_image_right(row6_2,i3d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i5d)

	row6_2 = concat_image_right(row6_2,i2c)
	row6_2 = concat_image_right(row6_2,i4d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 3a 1b   3a 1b   5a 2b   4a 2b   2b 5b   2b 4b
	# 5c 2d   4c 2d   3c 1d   3c 1d   1c 3d   1c 3d
	var row7_1:Image = concat_image_right(i3a,i1b)
	row7_1 = concat_image_right(row7_1,i3a)
	row7_1 = concat_image_right(row7_1,i1b)

	row7_1 = concat_image_right(row7_1,i5a)
	row7_1 = concat_image_right(row7_1,i2b)

	row7_1 = concat_image_right(row7_1,i4a)
	row7_1 = concat_image_right(row7_1,i2b)

	row7_1 = concat_image_right(row7_1,i2a)
	row7_1 = concat_image_right(row7_1,i5b)

	row7_1 = concat_image_right(row7_1,i2a)
	row7_1 = concat_image_right(row7_1,i4b)
	var row7_2:Image = concat_image_right(i5c,i2d)
	row7_2 = concat_image_right(row7_2,i4c)
	row7_2 = concat_image_right(row7_2,i2d)

	row7_2 = concat_image_right(row7_2,i3c)
	row7_2 = concat_image_right(row7_2,i1d)

	row7_2 = concat_image_right(row7_2,i3c)
	row7_2 = concat_image_right(row7_2,i1d)

	row7_2 = concat_image_right(row7_2,i1c)
	row7_2 = concat_image_right(row7_2,i3d)

	row7_2 = concat_image_right(row7_2,i1c)
	row7_2 = concat_image_right(row7_2,i3d)	
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --
	# 1a 1b   1a 3b   2a 2b   3a 1b   1a 1b   6a 6b
	# 2c 2d   1c 3d   1c 1d   3c 1d   1c 1d   6c 6d
	var row8_1:Image = concat_image_right(i1a,i1b)
	row8_1 = concat_image_right(row8_1,i1a)
	row8_1 = concat_image_right(row8_1,i3b)

	row8_1 = concat_image_right(row8_1,i2a)
	row8_1 = concat_image_right(row8_1,i2b)

	row8_1 = concat_image_right(row8_1,i3a)
	row8_1 = concat_image_right(row8_1,i1b)

	row8_1 = concat_image_right(row8_1,i1a)
	row8_1 = concat_image_right(row8_1,i1b)

	row8_1 = concat_image_right(row8_1,i6a)
	row8_1 = concat_image_right(row8_1,i6b)
	var row8_2:Image = concat_image_right(i2c,i2d)
	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i3d)

	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i3c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i1c)
	row8_2 = concat_image_right(row8_2,i1d)

	row8_2 = concat_image_right(row8_2,i6c)
	row8_2 = concat_image_right(row8_2,i6d)
	# -- -- * -- -- * -- -- * -- -- * -- -- * -- --

	var final:Image = concat_image_bottom(row1_1,row1_2)
	final = concat_image_bottom(final,row2_1)
	final = concat_image_bottom(final,row2_2)
	final = concat_image_bottom(final,row3_1)
	final = concat_image_bottom(final,row3_2)
	final = concat_image_bottom(final,row4_1)
	final = concat_image_bottom(final,row4_2)
	final = concat_image_bottom(final,row5_1)
	final = concat_image_bottom(final,row5_2)
	final = concat_image_bottom(final,row6_1)
	final = concat_image_bottom(final,row6_2)
	final = concat_image_bottom(final,row7_1)
	final = concat_image_bottom(final,row7_2)
	final = concat_image_bottom(final,row8_1)
	final = concat_image_bottom(final,row8_2)
	
	return final

func concat_image_right(base: Image, ext: Image):
	if base.get_width() == 0: return ext
	var output: Image = Image.new()		
	output.create(base.get_width() + ext.get_width(),base.get_height(),false,base.get_format())	
	output.blit_rect(base,Rect2(0,0,base.get_width(),base.get_height()),Vector2(0,0))
	output.blit_rect(ext,Rect2(0,0,ext.get_width(),ext.get_height()),Vector2(base.get_width(),0))
	return output

func concat_image_bottom(base: Image, ext: Image):
	if base.get_width() == 0: return ext
	var output: Image = Image.new()
	output.create_from_data(
		base.get_width(),
		base.get_height() + ext.get_height(),
		false,
		base.get_format(),
		base.get_data() + ext.get_data()
	)
	return output

# オートタイルサイズで画像を分割する
# 2次元配列
func cut_Spritesheet(image:Image,cut_size:Vector2) -> Array:
	
	if image.get_width() % int(cut_size.x) != 0 or image.get_height() % int(cut_size.y) != 0:
		printerr("わりきれないが？？？")
		return []
	
	var col_count = image.get_width() / cut_size.x
	var row_count = image.get_height() / cut_size.y
	
	var res_array = []
	for y in range(0,row_count):
		var row = []
		for x in range(0,col_count):
			var new_img:Image = Image.new()
			new_img.create(cut_size.x,cut_size.y,false,image.get_format())
			new_img.blit_rect(image,Rect2(x * cut_size.x, y * cut_size.y,cut_size.x,cut_size.y),Vector2.ZERO)
			# 全ピクセル透明なセルは追加しない
			if new_img.get_used_rect() != Rect2(0,0,0,0):
				row.append(new_img)
			else:
				# 空埋めする用
				row.append(null)
		res_array.append(row)
	
	return res_array

func blend_add(image:Image,src_image:Image) -> ImageTexture:
	var tex = ImageTexture.new()
	src_image.resize(image.get_width(), image.get_height())
	image.blend_rect(src_image,Rect2(0,0,image.get_width(), image.get_height()),Vector2.ZERO)
	tex.create_from_image(image)
	return tex
	
