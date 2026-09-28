extends Label

func _ready() -> void:
	%subtitle.visible = true
	await get_tree().create_timer(1).timeout
	%subtitle.visible = false
	
