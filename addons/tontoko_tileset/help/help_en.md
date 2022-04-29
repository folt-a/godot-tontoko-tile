# How to Use

---

![help_01_tab](./help_01_tab.webp)

TontokoTile Tab has been added to the top workspace.



![image-20220424214851811](./image-20220424214851811.png)

*** Set the Cell Size in "Tile Settings"**

![image-20220429205505666](./image-20220429205505666.png)

Select the type of image you want to add.

"Normal Tile" "AutoTile Wolf Editor" "AutoTile RPGMaker"

Add an image with "Select Image".

![image-20220429205707449](./image-20220429205707449.png)

Add a mark and set Tile Passage.

**Can mark rectangles by Left dragging.**

You can also "multiple SingleTile" or "AutoTile".

![image-20220429205847560](./image-20220429205847560.png)

Set the output Cell range in "Canvas size".

![image-20220429205940622](./image-20220429205940622.png)

Select the output path and press the "EXPORT!" Button.

![image-20220429210201651](./image-20220429210201651.png)

.tres file and an .png file are created.

# Tile Settings

![image-20220429205940622](./image-20220429205940622.png)

tile setting Menu at the bottom.

- "Tile Setting"Button
   - ![image-20220424214851811](./image-20220424214851811.png)
- Zindex setting corresponding to the mark.
- Whether to output the canvas background transparently
- TileSet、png output pathes（res:// style or OS file path style）
- EXPORT!

# Add Image Files

![image-20220429210529970](./image-20220429210529970.png)

- "Select Image" Select the tile image to add.


- "CanvasSize Auto Resize"
  - If checked, the canvas size will be larger if the image is out of the way.

- "Delete Selected Image"
  - Deletes the image selected in the list.
  - However, SingleTiled and AutoTiled ones will not deleted.
- "Delete ALL Image"

# Edit Canvas Tiles

Edit Tiles positions and Set Passage Marks

#### How to select images/marks on the canvas

![image-20220424221647185](./image-20220424221647185.png)=Image![image-20220424221705395](./image-20220424221705395.png)=Mark

Zoom : Ctrl + Wheel or +- buttons

Select : Left Click

Multi Select : Ctrl + Left Click

Rectangle Select : Left Dragging

Multi Rectangle Select : Ctrl + Left Dragging

Delete(only Mark) : Right Click

Rectangle Delete : Right Dragging

The canvas line are not displayed while zooming. It is displayed when it is set to 100%.

![help_06_canvas](./help_06_canvas.webp)

The selected tile will be outline colored. The color will change depending on the type of tile selected.

- Normal tile = Yellow
- MultiSingleTile = Green
- AutoTile = Blue

## Canvas top menu

![image-20220429205847560](./image-20220429205847560.png)

- Specify canvas size as cell / pixel
- CanvasSize
   - Images and Marks outside the canvas size will not be export. It is not included in the tileset.
- change Mark color.
- change Canvas Bg color.
   - "if image is over canvas size, canvas size change over." is checked, exported background color is this color.*
- change Grid line color

# Tool Buttons and Marks

![image-20220424223306555](./image-20220424223306555.png)

**Can mark rectangles by Left dragging.**

#### 1Col Buttons

#### Move and Select Images

![image-20220424221647185](./image-20220424221647185.png)

ShortcutKey : Q

Move and Select Images.

#### Move Marks

![image-20220424221705395](./image-20220424221705395.png)

ShortcutKey : W

Move and Select Marks.



#### Passable Mark

![image-20220424222231312](./image-20220424222231312.png)

ShortcutKey : １

Passable tile.can be entered. 

Same as without paint.

#### NOT Passable Mark

![image-20220424222240755](./image-20220424222240755.png)

ShortcutKey : ２

NOT Passable tile.\ncan not be entered. ※1

#### Star Mark

![image-20220424222253236](./image-20220424222253236.png)

ShortcutKey : ３

Passable tile.※1

Display above the character.

can be entered.

#### Star2 Mark

![image-20220424222304900](./image-20220424222304900.png)

ShortcutKey : ４

NOT Passable tile.※1

Display above the character.

can not be entered.

#### Triangle Mark

![image-20220424222314035](./image-20220424222314035.png)

ShortcutKey : ５

Passable tile.※1

can be entered.

Hides character if you go behind it.



#### NOT Passable small Mark

![image-20220424222332572](./image-20220424222332572.png)![image-20220424222404595](./image-20220424222404595.png)

ShortcutKey : ６

NOT Passable tile.

Half,One Third, Quarter size. 

It can be placed in the same Cell as other marks.

The setting of this Cell has priority.

#### Eraser

![image-20220424222508571](./image-20220424222508571.png)

ShortcutKey : E

Delete Mark.

also can delete it by Right Dragging.

#### Image Cursor

![image-20220424222521819](./image-20220424222521819.png)

ShortcutKey : C

Move set Image Cursor.

New Image add at this Cursor.



※1 It just changes the Zindex. For the stacking order, the value of Zindex at the bottom is entered. 

It is assumed that the character is Zindex = 0. Please change if necessary.



### 2 Col Buttons

#### Move Lock

![image-20220424222636347](./image-20220424222636347.png)

ShortcutKey : Ｌ

Lock Image movement by Left Dragging.

#### To SingleTile

![image-20220424222645315](./image-20220424222645315.png)

ShortcutKey : Ｓ

Make multiple tiles into one SingleTile.

#### To AutoTile

![image-20220424222656139](./image-20220424222656139.png)

ShortcutKey : Ａ

Makes multiple tiles into one AutoTile.

1x3, 3x1, 3x2, 3x3, 3x3(middle hole)

#### Delete

![image-20220424222804699](./image-20220424222804699.png)

ShortcutKey : None

Delete selected Image or Mark.



