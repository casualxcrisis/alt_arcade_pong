extends CharacterBody2D

@export var ball_speed = 12

var array: Array[int] = [1, 2, 3, -1, -2, -3] # sets the array to choose a random number from to vary the serve angle
var other_array: Array[Variant] = [-ball_speed, ball_speed] # sets the array to choose either a left-side serve or right-side serve

func _ready() -> void:
	get_node("AnimatedSprite2D").visible = false
	get_node("%countdown_numbers").visible = true
	get_node("%countdown_numbers").set_text("3")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("2")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("1")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("GRIP!")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").visible = false
	get_node("AnimatedSprite2D").visible = true
	velocity = Vector2(other_array.pick_random(), array.pick_random()) # this will launch the ball to the left, maybe add an conditional that flips it if the ball has collided with other side - to simulate the serve from winning player
	
func _process(_delta: float) -> void:
	$AnimatedSprite2D.play("idle")	
	

func _physics_process(_delta: float) -> void:
	var collision :KinematicCollision2D= move_and_collide(velocity)
	if collision:
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
		
			
