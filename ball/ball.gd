extends CharacterBody2D

@export var ball_speed = 12

func _ready() -> void:
	velocity = Vector2(-ball_speed, 0) # this will launch the ball to the left, maybe add an conditional that flips it if the ball has collided with other side - to simulate the serve from winning player
	
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("idle")	

func _physics_process(_delta: float) -> void:
	var collision :KinematicCollision2D= move_and_collide(velocity)
	if collision:
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
