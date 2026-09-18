extends CharacterBody2D

@export var speed = 400

@onready var base_sprite_scale_y = $player_right_sprite.scale.y
@onready var base_sprite_scale_x = $player_right_sprite.scale.x
@onready var base_coll_scale_y = $player_right_collision.scale.y



func getYDir() -> float:
	return Input.get_action_strength("p_right_down") - Input.get_action_strength("p_right_up")
	
	
func _process(_delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * speed
	if Input.is_action_just_pressed("p_right_down"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("p_right_up"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("grow_right"):
		$player_right_sprite.scale.y = base_sprite_scale_y * 5
		$player_right_sprite.scale.x = base_sprite_scale_x * 5
		$player_right_collision.scale.y = base_coll_scale_y * 5
	elif Input.is_action_just_released("grow_right"):
		$player_right_sprite.scale.y = base_sprite_scale_y
		$player_right_sprite.scale.x = base_sprite_scale_x
		$player_right_collision.scale.y = base_coll_scale_y	
	move_and_slide()
	
