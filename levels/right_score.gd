extends Label

var right_score = 0

func _ready() -> void:
	%right_score.set_text("Score: 0")

func _on_right_score_zone_body_entered(body: Node2D) -> void:
	right_score += 1
	var string = var_to_str(right_score)
	%right_score.set_text("Score: " + string)
	
