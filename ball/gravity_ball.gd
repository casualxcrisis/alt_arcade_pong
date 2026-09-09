extends RigidBody2D

@export var ball_speed = 12


func _ready() -> void:
	linear_velocity = Vector2(-ball_speed, 0) # this will launch the ball to the left, maybe add an conditional that flips it if the ball has collided with other side - to simulate the serve from winning player
	
func _physics_process(delta: float) -> void:
	var collision :KinematicCollision2D= move_and_collide(linear_velocity)
	if collision:
		var normal := collision.get_normal()
		linear_velocity = linear_velocity.bounce(normal)
