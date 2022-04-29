tool
extends MarginContainer

var circle_icon = preload("res://addons/tontoko_tileset/images/circle-question-24.svg")
var tile_icon = preload("res://addons/tontoko_tileset/images/tile-24.svg")
var image_icon = preload("res://addons/tontoko_tileset/images/image-24.svg")
var canvas_icon = preload("res://addons/tontoko_tileset/images/empty-grid-24.svg")
var mark_icon = preload("res://addons/tontoko_tileset/images/batu-grid-24.svg")

func _ready():
	TranslationServer.set_locale(OS.get_locale())
#	TranslationServer.set_locale("en")
	$TabContainer.set_tab_icon(0,circle_icon)
	$TabContainer.set_tab_icon(1,tile_icon)
	$TabContainer.set_tab_icon(2,image_icon)
	$TabContainer.set_tab_icon(3,canvas_icon)
	$TabContainer.set_tab_icon(4,mark_icon)
#	print("使い方")
	if TranslationServer.get_locale() == "ja_JP":
		$TabContainer.set_tab_title(0,"使い方")
		$TabContainer.set_tab_title(1,"タイル設定")
		$TabContainer.set_tab_title(2,"画像追加")
		$TabContainer.set_tab_title(3,"キャンバス操作")
		$TabContainer.set_tab_title(4,"ボタン・マーク説明")
		
		$TabContainer/Tutorial/RichTextLabel.bbcode_text = read_bbcode("help_01_tutorial")
		$TabContainer/Tile/RichTextLabel.bbcode_text = read_bbcode("help_02_tile")
		$TabContainer/Image/RichTextLabel.bbcode_text = read_bbcode("help_03_image")
		$TabContainer/Canvas/RichTextLabel.bbcode_text = read_bbcode("help_04_canvas")
		$TabContainer/ButtonMark/RichTextLabel.bbcode_text = read_bbcode("help_05_buttons_marks")
		
	else:
		$TabContainer.set_tab_title(0,"Tutorial")
		$TabContainer.set_tab_title(1,"Tile")
		$TabContainer.set_tab_title(2,"Image")
		$TabContainer.set_tab_title(3,"Canvas")
		$TabContainer.set_tab_title(4,"Buttons/Marks")
		
		$TabContainer/Tutorial/RichTextLabel.bbcode_text = read_bbcode("help_01_tutorial_en")
		$TabContainer/Tile/RichTextLabel.bbcode_text = read_bbcode("help_02_tile_en")
		$TabContainer/Image/RichTextLabel.bbcode_text = read_bbcode("help_03_image_en")
		$TabContainer/Canvas/RichTextLabel.bbcode_text = read_bbcode("help_04_canvas_en")
		$TabContainer/ButtonMark/RichTextLabel.bbcode_text = read_bbcode("help_05_buttons_marks_en")
		
		
func read_bbcode(filepath) -> String: 
	var file = File.new()
	file.open("res://addons/tontoko_tileset/help/" + filepath + ".txt",File.READ)
	var text = file.get_as_text()
	file.close()
	return text
