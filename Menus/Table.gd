extends KinematicBody2D

class_name table

# Executes every frame
func _physics_process(_delta):
	if Input.is_action_pressed("ui_left"):
		global_position.x -= 1
	if Input.is_action_pressed("ui_right"):
		global_position.x += 1
	if global_position.x < 25:
		global_position.x = 25
	if global_position.x > 111:
		global_position.x = 111
