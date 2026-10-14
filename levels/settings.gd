extends Button


func _process(delta: float) -> void:
	if Globals.set_dys_font:
		add_theme_font_override("font", Globals.dys_font)
		add_theme_font_size_override("font_size", 22)
	else:
		add_theme_font_override("font", Globals.default_font)
		add_theme_font_size_override("font_size", 20)



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/settings_menu.tscn")
