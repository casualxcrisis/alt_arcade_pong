extends CharacterBody2D

@export var speed = 700
@export var acceleration = 2000

@onready var base_sprite_scale_y = $player_left_sprite.scale.y
@onready var base_sprite_scale_x = $player_left_sprite.scale.x
@onready var base_coll_scale_y = $player_left_collision.scale.y
@onready var base_vel_setter_y = %vel_setter.scale.y
@onready var base_vel_setter_coll_y = $%vel_setter_col.scale.y



var grow_pts = 0

func _ready() -> void:
	%left_grow_pts.set_text("Grow Charge: 0")
	await get_tree().create_timer(200).timeout
	speed += 500

func getYDir() -> float:
	return Input.get_action_strength("p_left_down") - Input.get_action_strength("p_left_up")
	
		
	
func _process(_delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = velocity.move_toward(dir * speed, _delta * acceleration)
	if Input.is_action_just_pressed("p_left_down"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("p_left_up"):
		$AudioStreamPlayer2D.play()		
	elif Input.is_action_just_pressed("grow"):
		if grow_pts == 2:
			%grow_noise.play()
			$player_left_sprite.scale.y = base_sprite_scale_y * 5
			$player_left_sprite.scale.x = base_sprite_scale_x * 5
			$player_left_collision.scale.y = base_coll_scale_y * 5
			$vel_setter.scale.y = base_vel_setter_y * 5
			$%vel_setter_col.scale.y = base_vel_setter_coll_y * 5
			await get_tree().create_timer(2).timeout
			$player_left_sprite.scale.y = base_sprite_scale_y
			$player_left_sprite.scale.x = base_sprite_scale_x
			$player_left_collision.scale.y = base_coll_scale_y
			$vel_setter.scale.y = base_vel_setter_y
			$%vel_setter_col.scale.y = base_vel_setter_coll_y
			grow_pts -= 2
			var string = var_to_str(grow_pts)
			%left_grow_pts.set_text("Grow Charge: " + string)
	move_and_slide()
		



func _on_left_score_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		grow_pts += 1
		var string = var_to_str(grow_pts)
		%left_grow_pts.set_text("Grow Charge: " + string)
