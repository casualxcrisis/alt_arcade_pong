extends CharacterBody2D

@export var speed = 400

func getYDir() -> float:
	return Input.get_action_strength("p_left_down") - Input.get_action_strength("p_left_up")
	
	
func _process(delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * speed
	move_and_slide()
