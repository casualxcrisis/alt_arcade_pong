extends RigidBody2D

#sets serve speed
var ball_serve_speed: Array[int] = [6, 7, 8, 9, 10, -6, -7. -8, -9, -10]
#sets serve angle
var serve_angle: Array[int] = [1, 2, 3, -1, -2, -3] 
#sets speed for volleys
var velocity_array: Array[int] = [6, 7, 8, 9, 10, -6, -7, -8, -9, -10]

func _ready() -> void:
	set_gravity_scale(0.0) #set gravity to zero so it's a floating ball effect
	%new_ball.play("ball_birth")
	await get_tree().create_timer(0.9).timeout
	linear_velocity = Vector2(ball_serve_speed.pick_random(), serve_angle.pick_random())
	
	
func _process(_delta: float) -> void:
	await get_tree().create_timer(0.9).timeout
	$new_ball.play("idle")
	

func _physics_process(_delta: float) -> void:
	var collision :KinematicCollision2D= move_and_collide(linear_velocity)
	if collision:
		var normal := collision.get_normal()
		linear_velocity = linear_velocity.bounce(normal)
		


func _on_velocity_setter_area_entered(area: Area2D) -> void:
	if area.is_in_group("paddles"):
		set_linear_velocity(Vector2(velocity_array.pick_random(), velocity_array.pick_random()))
		%paddle_hit.emitting = true
