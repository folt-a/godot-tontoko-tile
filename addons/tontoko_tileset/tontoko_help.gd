tool
extends MarginContainer

var circle_icon = preload("res://addons/tontoko_tileset/images/circle-question-24.svg")
var tile_icon = preload("res://addons/tontoko_tileset/images/tile-24.svg")
var image_icon = preload("res://addons/tontoko_tileset/images/image-24.svg")
var canvas_icon = preload("res://addons/tontoko_tileset/images/empty-grid-24.svg")
var mark_icon = preload("res://addons/tontoko_tileset/images/batu-grid-24.svg")

func _ready():
	TranslationServer.set_locale(OS.get_locale())
	$TabContainer.set_tab_icon(0,circle_icon)
	$TabContainer.set_tab_icon(1,tile_icon)
	$TabContainer.set_tab_icon(2,image_icon)
	$TabContainer.set_tab_icon(3,canvas_icon)
	$TabContainer.set_tab_icon(4,mark_icon)
	print("使い方")
	if TranslationServer.get_locale() == "ja_JP":
		$TabContainer.set_tab_title(0,"使い方")
		$TabContainer.set_tab_title(1,"タイル設定")
		$TabContainer.set_tab_title(2,"画像追加")
		$TabContainer.set_tab_title(3,"キャンバス操作")
		$TabContainer.set_tab_title(4,"ボタン・マーク説明")
		
	else:
		$TabContainer.set_tab_title(0,"Tutorial")
		$TabContainer.set_tab_title(1,"Tile")
		$TabContainer.set_tab_title(2,"Image")
		$TabContainer.set_tab_title(3,"Canvas")
		$TabContainer.set_tab_title(4,"Button, Mark")
		
