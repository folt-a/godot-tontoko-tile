# Tontoko Tile - Godot TileSet Easy Maker

**This Addon is Godot3.X, outdated. Godot4 version is under developping.**

このアドオンはGodot3用です。現行のGodot4版は現在開発中です。

![image-20220425004254572](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220425004254572.png)

**This Addon is Godot3.X, outdated. Godot4 version is under developping.**

このアドオンはGodot3用です。現行のGodot4版は現在開発中です。

オートタイルはこんな感じに作るよ動画　AutoTile Movie!

[開発中の動画１ dev movie1 in Twitter](https://twitter.com/i/status/1495674099594850309)

[開発中の動画２ dev movie2 in Twitter](https://twitter.com/i/status/1495309899865096192)

---
英語 (English)

**I am working towards Godot 4.**
**I plan to remove the feature to move and reorder tile images.**

**Tontoko Tile Supports English/Japanese GUI**

Tontoko Tile is godot addon that makes it easy to create Godot Tileset.

Read the png file (s) and output the tileset tres file and the final png file.

It has the following this tool feature.

* Arrangement and sorting of tile images
* Collision settings for tile, Character Passage can be set by painting the mark
* ZIndex and YSort can be set by the mark
* Auto tile can be set
Corresponding rectangular mass format 1x3, 3x1, 3x2, 3x3, 3x3 (middle hole)
* Supports "Wolf Editor" and "RPGMaker" style AutoTile.
* Multiple rectangular cells can be registered as a SingleTile

### To install
download it as a ZIP archive.<br>Extract and move the addons/ directory it contains into your project folder. Then, enable the plugin in project settings.<br>And reload godot editor.

### Tips
* It is easier to use TileSet Pallet if you make it Image Width narrower
* there is no save feature. if the image is too large, you will make a mistake, so make multiple small TileSets.
  * [merge-tileset](https://github.com/folt-a/godot3-batch-commands)You may want to merge the TileSet later.
* There is a limit to the specifications of multiple SingleTiles, and collisions refer to those of each Cell.  
ZIndex is one same ZIndex with one multiple SingleTile (most top left Cell)

**[⇓How To Use](https://github.com/folt-a/tontoko_tile#how-to-use)** Document also in the add-on

---
日本語 (Japanese)

**Godot4用に作り直し中です。**
**タイル画像の移動と並び替えの機能は削除する予定です。**
（Godotエディタじゃなくて画像ソフトでやった方がいいな……ってなりました）

とんとこタイルはGodotのタイルセットをかんたんに作るアドオンです。

pngファイルを読み込み（複数可）、タイルセットのtresファイルと最終pngファイルを出力します。

以下の機能があります。

* タイル画像の配置、並び替え
* セルに対するコリジョンの設定, マークを塗ることで通行設定が可能
* マークによってZindex、YSortを設定可能
* オートタイルを設定可能  
対応矩形マス形式　1x3, 3x1, 3x2, 3x3, 3x3(真ん中穴)
* ウディタ形式のオートタイル画像、ツクール形式のオートタイル画像に対応。
* 複数矩形マスをシングルタイルとして登録可能

### インストール方法
tontoko_tile を addons ディレクトリに配置します。<br>プロジェクト設定→プラグインから TontokoTile を有効化します。<br>その後プロジェクトを再起動してアドオンを反映させます。

### ポイント
* 幅を狭めに作ったほうがパレットが使いやすい
* セーブ機能がないので画像が大きすぎるとミスするので小さめのtilesetを複数作る
  * [merge-tileset](https://github.com/folt-a/godot3-batch-commands)あとでTileSetをマージするのもあり。
* 複数シングルタイルには仕様上の限界があり、コリジョンは各マスのものを参照するが、ZIndexは複数シングルタイル1枚で1つの同じZIndexになる（左上のマス）ので注意。

**[⇓使い方（日本語）](https://github.com/folt-a/tontoko_tile#%E4%BD%BF%E3%81%84%E6%96%B9)** ドキュメントはアドオン内でもみれます

---

# How to Use

---

![help_01_tab](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_01_tab.webp)

TontokoTile Tab has been added to the top workspace.



![image-20220424214851811](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424214851811.png)

*** Set the Cell Size in "Tile Settings"**

![image-20220429205505666](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205505666.png)

Select the type of image you want to add.

"Normal Tile" "AutoTile Wolf Editor" "AutoTile RPGMaker"

Add an image with "Select Image".

![image-20220429205707449](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205707449.png)

Add a mark and set Tile Passage.

**Can mark rectangles by Left dragging.**

You can also "multiple SingleTile" or "AutoTile".

![image-20220429205847560](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205847560.png)

Set the output Cell range in "Canvas size".

![image-20220429205940622](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205940622.png)

Select the output path and press the "EXPORT!" Button.

![image-20220429210201651](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429210201651.png)

.tres file and an .png file are created.

# Tile Settings

![image-20220429205940622](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205940622.png)

tile setting Menu at the bottom.

- "Tile Setting"Button
  - ![image-20220424214851811](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424214851811.png)
- Zindex setting corresponding to the mark.
- Whether to output the canvas background transparently
- TileSet、png output pathes（res:// style or OS file path style）
- EXPORT!

# Add Image Files

![image-20220429210529970](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429210529970.png)

- "Select Image" Select the tile image to add.


- "CanvasSize Auto Resize"
  - If checked, the canvas size will be larger if the image is out of the way.

- "Delete Selected Image"
  - Deletes the image selected in the list.
  - However, SingleTiled and AutoTiled ones will not deleted.
- "Delete ALL Image"

# Edit Canvas Tiles

Edit Tiles positions and Set Passage Marks

#### How to select images on the canvas

![image-20220424221647185](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221647185.png)

Zoom : Ctrl + Wheel or +- buttons

Select : Left Click

Multi Select : Ctrl + Left Click

Rectangle Select : Left Dragging

Multi Rectangle Select : Ctrl + Left Dragging

Delete(only Mark) : Right Click

Rectangle Delete : Right Dragging

The canvas line are not displayed while zooming. It is displayed when it is set to 100%.

![help_06_canvas](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_06_canvas.webp)

The selected tile will be outline colored. The color will change depending on the type of tile selected.

- Normal tile = Yellow
- MultiSingleTile = Green
- AutoTile = Blue

## Canvas top menu

![image-20220429205847560](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220429205847560.png)

- Specify canvas size as cell / pixel
- CanvasSize
  - Images and Marks outside the canvas size will not be export. It is not included in the tileset.
- change Mark color.
- change Canvas Bg color.
  - "if image is over canvas size, canvas size change over." is checked, exported background color is this color.*
- change Grid line color

# Tool Buttons and Marks

![image-20220424223306555](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424223306555.png)

**Can mark rectangles by Left dragging.**

#### 1Col Buttons

#### Move and Select Images

![image-20220424221647185](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221647185.png)

ShortcutKey : Q

Move and Select Images.

#### Passable Mark

![image-20220424222231312](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222231312.png)

ShortcutKey : １

Passable tile.can be entered. 

Same as without paint.

#### NOT Passable Mark

![image-20220424222240755](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222240755.png)

ShortcutKey : ２

NOT Passable tile.\ncan not be entered. ※1

#### Star Mark

![image-20220424222253236](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222253236.png)

ShortcutKey : ３

Passable tile.※1

Display above the character.

can be entered.

#### Star2 Mark

![image-20220424222304900](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222304900.png)

ShortcutKey : ４

NOT Passable tile.※1

Display above the character.

can not be entered.

#### Triangle Mark

![image-20220424222314035](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222314035.png)

ShortcutKey : ５

Passable tile.※1

can be entered.

Hides character if you go behind it.



#### NOT Passable small Mark

![image-20220424222332572](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222332572.png)![image-20220424222404595](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222404595.png)

ShortcutKey : ６

NOT Passable tile.

Half,One Third, Quarter size. 

It can be placed in the same Cell as other marks.

The setting of this Cell has priority.

#### Eraser

![image-20220424222508571](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222508571.png)

ShortcutKey : E

Delete Mark.

also can delete it by Right Dragging.

#### Image Cursor

![image-20220424222521819](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222521819.png)

ShortcutKey : C

Move set Image Cursor.

New Image add at this Cursor.



※1 It just changes the Zindex. For the stacking order, the value of Zindex at the bottom is entered. 

It is assumed that the character is Zindex = 0. Please change if necessary.



### 2 Col Buttons

#### Move Lock

![image-20220424222636347](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222636347.png)

ShortcutKey : Ｌ

Lock Image movement by Left Dragging.

#### To SingleTile

![image-20220424222645315](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222645315.png)

ShortcutKey : Ｓ

Make multiple tiles into one SingleTile.

#### To AutoTile

![image-20220424222656139](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222656139.png)

ShortcutKey : Ａ

Makes multiple tiles into one AutoTile.

1x3, 3x1, 3x2, 3x3, 3x3(middle hole)

#### Delete

![image-20220424222804699](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222804699.png)

ShortcutKey : None

Delete selected Image or Mark.



# 使い方

---

![help_01_tab](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_01_tab.webp)

上部ワークスペースに TontokoTile が追加されています。



![image-20220424214851811](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424214851811.png)

**※「タイル設定」のCellSizeを設定する**

![image-20220424220127102](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424220127102.png)

追加する画像の種類を選択します。

「通常タイル」「オートタイルウディタ形式」「オートタイルツクール形式」から選択します。

「画像選択」で画像追加します。

![image-20220424223609763](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424223609763.png)

マークをつけて通行設定をします。

**マークは、ドラッグでまとめて矩形マークできます。**

複数シングルタイル化やオートタイル化をします。

![help_04_canvassetting](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_04_canvassetting.webp)

出力するマス範囲を「キャンバスサイズ」で設定します。

![help_03_footer](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_03_footer.webp)

出力パスを指定して「出力！」ボタンを押します。

![image-20220424221006149](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221006149.png)

tresファイル、画像ファイルが作成されます。

# タイル設定

![help_03_footer](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_03_footer.webp)

下部にタイル設定があります。

- タイル設定ボタン
  - ![image-20220424214851811](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424214851811.png)
- 各マークに対応するZindexの設定
- キャンバス背景は透明で出力するかどうか
- TileSet、出力PNG画像の出力パス（res:// 形式か、OSファイルパス形式かどちらでもOK）
- 出力ボタン！

# 画像追加

![image-20220424221304508](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221304508.png)

- 「画像選択」　追加するタイル画像を選択します。


- キャンバスサイズ自動調整
  - チェックが入っていると、画像がはみだす場合にキャンバスサイズが合わせて大きくなります。

- ↑で選択した画像を削除
  - リストで選択した画像を削除します。
  - ただし、シングルタイル化やオートタイル化したものは消えません。
- 全ての画像を削除

# キャンバス操作

## 操作

タイルの位置いれかえや通行設定のマークをつけます。

#### キャンバス上の画像選択のやり方

![image-20220424221647185](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221647185.png)

ズーム：Ctrl+マウスホイール　または左上の+-ボタン

選択：左クリック、複数選択：Ctrl+左クリック

矩形選択：左ドラッグ、複数矩形選択：Ctrl+左ドラッグ

削除（マークのみ）：右クリック

矩形削除：右ドラッグ

ズーム中はキャンバス線の表示が消えます。100%にすると表示されます。

![help_06_canvas](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_06_canvas.webp)

選択中のタイルには色が付きます。選択したタイルの種類によって色は変わります。

- 通常タイル＝黄色
- 複数シングルタイル＝緑色
- オートタイル＝青色

## キャンバス上部メニュー

![help_04_canvassetting](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/help_04_canvassetting.webp)

- キャンバスサイズの指定をマス/ピクセルにする
- キャンバスサイズ
  - キャンバスサイズ外の画像、マークは画像出力されません。tilesetにも含まれません。
- マーク色変更
- キャンバス背景色変更
  - *キャンバス背景は透明で出力* にチェックが入っている場合は、この色が背景色になります。
- グリッド色変更

# ボタン・マーク説明

![image-20220424223306555](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424223306555.png)

**マークは、ドラッグでまとめてマークできます。**

#### 各マークについて

#### 画像移動

![image-20220424221647185](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424221647185.png)

ショートカットキー：Q

画像の移動、選択をします。

#### 丸マーク

![image-20220424222231312](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222231312.png)

ショートカットキー：１

通行可能タイルにします。印ペイントなしと全く同じです。

#### バツマーク

![image-20220424222240755](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222240755.png)

ショートカットキー：２

タイルを通行不可にします。※1

#### 星マーク

![image-20220424222253236](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222253236.png)

ショートカットキー：３

常にキャラの上に表示します。※1

下をくぐって通れます。

#### 星マーク２

![image-20220424222304900](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222304900.png)

ショートカットキー：４

常にキャラの上に表示します。※1

下をくぐって通れません。

#### 三角マーク

![image-20220424222314035](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222314035.png)

ショートカットキー：５

後ろに行くと隠れます。※1

#### 詳細バツマーク

![image-20220424222332572](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222332572.png)![image-20220424222404595](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222404595.png)

ショートカットキー：６

1/2, 3/1, 1/4 サイズで通行禁止にします。

他マークと同マスに置けます。

そのマスのすべての通行設定は詳細バツマークの内容になります。

#### 消しゴム

![image-20220424222508571](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222508571.png)

ショートカットキー：E

マークを削除します。

ペイントツール中に右ドラッグでも削除可能です。

#### マスカーソル

![image-20220424222521819](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222521819.png)

ショートカットキー：C

マスカーソルを移動します。

キャンバスへの画像追加はマスカーソル位置に追加されます。



※1 Zindexが変わるというだけです。重なり順については下部のZindexの値が入ります。キャラがZindex=0という想定です。必要なら変更してください。



### 2列目

#### 移動ロック

![image-20220424222636347](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222636347.png)

ショートカットキー：Ｌ

画像がドラッグで移動しないようにします。

#### シングルタイル化

![image-20220424222645315](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222645315.png)

ショートカットキー：Ｓ

選択中の複数画像タイルが矩形の場合にボタンを押すことができます。

複数タイルを１つのシングルタイルにします。

#### オートタイル化

![image-20220424222656139](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222656139.png)

ショートカットキー：Ａ

選択中の複数画像タイルをオートタイルにします。

対応…1x3, 3x1, 3x2, 3x3, 3x3(真ん中穴)

#### 削除

![image-20220424222804699](https://github.com/folt-a/tontoko_tile/blob/master/addons/tontoko_tileset/help/image-20220424222804699.png)

ショートカットキー：なし

選択中の画像またはマークを削除します。
