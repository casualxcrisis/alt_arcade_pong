extends Label

var left_score = 0


func _ready() -> void:
	%left_score.set_text("Score: 0")
	
	
func _on_left_score_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		left_score += 1
		var string = var_to_str(left_score)
		%left_score.set_text("Score: " + string)
		body.queue_free()
		get_node("%press_r").visible = true
		get_node("%press_r").set_text("Left Player Scores! \nPress 'R' to Re-serve")
		
func _process(delta: float) -> void:
	if left_score == 10:
		get_tree().change_scene_to_file("res://levels/left_win.tscn")

	
	
	
	
	
	
