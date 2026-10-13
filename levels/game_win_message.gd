extends Label

func _process(delta: float) -> void:
	if Globals.set_dys_font:
		add_theme_font_override("font", Globals.dys_font)
		add_theme_font_size_override("font_size", 100)
	else:
		add_theme_font_override("font", Globals.default_font)
		add_theme_font_size_override("font_size", 60)
