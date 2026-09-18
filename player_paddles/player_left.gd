extends CharacterBody2D

@export var speed = 400

@onready var base_sprite_scale_y = $Sprite2D.scale.y
@onready var base_sprite_scale_x = $Sprite2D.scale.x
@onready var base_coll_scale_y = $CollisionShape2D.scale.y

func getYDir() -> float:
	return Input.get_action_strength("p_left_down") - Input.get_action_strength("p_left_up")
	
	
		
	
func _process(_delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * speed
	if Input.is_action_just_pressed("p_left_down"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("p_left_up"):
		$AudioStreamPlayer2D.play()		
	elif Input.is_action_just_pressed("grow"):
		$Sprite2D.scale.y = base_sprite_scale_y * 5
		$Sprite2D.scale.x = base_sprite_scale_x * 5
		$CollisionShape2D.scale.y = base_coll_scale_y * 5
	elif Input.is_action_just_released("grow"):
		$Sprite2D.scale.y = base_sprite_scale_y
		$Sprite2D.scale.x = base_sprite_scale_x
		$CollisionShape2D.scale.y = base_coll_scale_y
	move_and_slide()
