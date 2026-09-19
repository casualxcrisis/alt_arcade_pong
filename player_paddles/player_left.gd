extends CharacterBody2D

@export var speed = 200

@onready var base_sprite_scale_y = $Sprite2D.scale.y
@onready var base_sprite_scale_x = $Sprite2D.scale.x
@onready var base_coll_scale_y = $CollisionShape2D.scale.y

var grow_pts = 0

func _ready() -> void:
	%left_grow_pts.set_text("Grow Charge: 0")
	await get_tree().create_timer(200).timeout
	speed += 500

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
		if grow_pts == 2:
			$Sprite2D.scale.y = base_sprite_scale_y * 5
			$Sprite2D.scale.x = base_sprite_scale_x * 5
			$CollisionShape2D.scale.y = base_coll_scale_y * 5
			await get_tree().create_timer(2).timeout
			$Sprite2D.scale.y = base_sprite_scale_y
			$Sprite2D.scale.x = base_sprite_scale_x
			$CollisionShape2D.scale.y = base_coll_scale_y
			grow_pts -= 2
			var string = var_to_str(grow_pts)
			%left_grow_pts.set_text("Grow Charge: " + string)
	move_and_slide()
		



func _on_left_score_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		grow_pts += 1
		var string = var_to_str(grow_pts)
		%left_grow_pts.set_text("Grow Charge: " + string)
