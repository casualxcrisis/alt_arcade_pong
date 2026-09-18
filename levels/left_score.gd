extends Label

var left_score = 0

func _ready() -> void:
	%left_score.set_text("Score: 0")
	
	
func _on_left_score_zone_body_entered(body: Node2D) -> void:
	left_score += 1
	var string = var_to_str(left_score)
	%left_score.set_text("Score: " + string)
	
	
	
	
	
	
	
