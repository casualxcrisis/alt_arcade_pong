extends Node2D

var ball = preload("res://ball/ball.tscn")

func _ready() -> void:
	get_node("%countdown_numbers").set_text("3")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("2")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("1")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").set_text("GRIP!")
	await get_tree().create_timer(1).timeout
	get_node("%countdown_numbers").visible = false
	inst(Vector2(560,350))


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		inst(Vector2(560,350))
		
	


func  inst(pos):
	var instance = ball.instantiate()
	instance.position = pos
	add_child(instance)
