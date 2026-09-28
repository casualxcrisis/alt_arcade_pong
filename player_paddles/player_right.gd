extends CharacterBody2D

@export var speed = 700
@export var acceleration = 2000

@onready var base_sprite_scale_y = $player_right_sprite.scale.y
@onready var base_sprite_scale_x = $player_right_sprite.scale.x
@onready var base_coll_scale_y = $player_right_collision.scale.y

var grow_pts = 0

func _ready() -> void:
	%right_grow_pts.set_text("Grow charge: 0")
	await get_tree().create_timer(200).timeout
	speed += 500

func getYDir() -> float:
	return Input.get_action_strength("p_right_down") - Input.get_action_strength("p_right_up")
	
	
func _process(_delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = velocity.move_toward(dir * speed, _delta * acceleration)
	if Input.is_action_just_pressed("p_right_down"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("p_right_up"):
		$AudioStreamPlayer2D.play()
	elif Input.is_action_just_pressed("grow_right"):
		if grow_pts == 2:
			%grow_noise.play()
			$player_right_sprite.scale.y = base_sprite_scale_y * 5
			$player_right_sprite.scale.x = base_sprite_scale_x * 5
			$player_right_collision.scale.y = base_coll_scale_y * 5
			await get_tree().create_timer(2).timeout
			$player_right_sprite.scale.y = base_sprite_scale_y
			$player_right_sprite.scale.x = base_sprite_scale_x
			$player_right_collision.scale.y = base_coll_scale_y
			grow_pts -= 2
			var string = var_to_str(grow_pts)
			%right_grow_pts.set_text("Grow Charge: " + string)
	move_and_slide()
	


func _on_right_score_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		grow_pts += 1
		var string = var_to_str(grow_pts)
		%right_grow_pts.set_text("Grow Charge: " + string)
