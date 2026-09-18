extends CharacterBody2D

@export var speed = 400

func getYDir() -> float:
	return Input.get_action_strength("p_right_down") - Input.get_action_strength("p_right_up")
	
	
func _process(_delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * speed
	if Input.is_action_just_pressed("p_right_down"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("p_right_up"):
		$AudioStreamPlayer2D.play()
	move_and_slide()
	
