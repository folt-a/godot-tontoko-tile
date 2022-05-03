tool
extends EditorPlugin

var tontoko_tileset
var tontoko_tileset_path = "res://addons/tontoko_tileset/tontoko_tileset.tscn"
var tontoko_tileset_save_path = "res://addons/tontoko_tileset/tontoko_tileset_save.tscn"
var S # translation singleton

func _enter_tree():
	
	S = load("res://addons/tontoko_tileset/tontoko_strings.gd").get_translation_singleton(self)
	get_tree().set_meta("__editor_interface", get_editor_interface())
	get_tree().set_meta("__undo_redo", get_undo_redo())
	
	var file_save = File.new()
	if file_save.file_exists(tontoko_tileset_save_path):
		tontoko_tileset = load(tontoko_tileset_save_path).instance()
	else:
		tontoko_tileset = load(tontoko_tileset_path).instance()
	
	get_editor_interface().get_editor_viewport().add_child(tontoko_tileset)
	tontoko_tileset.visible = false
#	tontoko_tileset.hoge()


func _exit_tree():
	
#	tontoko_tileset.save()

	get_editor_interface().get_editor_viewport().remove_child(tontoko_tileset)
	tontoko_tileset.queue_free()


#func _input(event):
#
#	if event is InputEventKey:
#		if event.pressed and event.scancode == KEY_SPACE && event.control:
#			get_editor_interface().set_main_screen_editor("Project")


func has_main_screen():
	return true


func get_plugin_name():
	return "TontokoTile"
	

func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("TileSet", "EditorIcons")


func make_visible(visible):
	# 初回はタイルサイズ設定画面を出す
	var fl = File.new()
	if visible and !fl.file_exists("res://addons/tontoko_tileset/save.dat"):
		tontoko_tileset._on_ButtonSetting_pressed()
		
	tontoko_tileset.visible = visible


func apply_changes():
#	tontoko_tileset.save()
	pass

func save_external_data():
	
#	tontoko_tileset.save()
	pass
