extends Label

var right_score = 0

func _ready() -> void:
	%right_score.set_text("Score: 0")

func _on_right_score_zone_body_entered(body: Node2D) -> void:
	right_score += 1
	var string = var_to_str(right_score)
	%right_score.set_text("Score: " + string)
	body.queue_free()
	get_node("%press_r").visible = true
	get_node("%press_r").set_text("Right Player Scores! \nPress 'R' to Re-serve")
	
