extends KinematicBody2D

var velocity : Vector2 = Vector2()

const FLOOR : Vector2 = Vector2(0, -1)
const SPEED : int = 40

var table : table

# Executes every frame
func _physics_process(_delta):
	velocity = move_and_slide(velocity.normalized() * SPEED, FLOOR)
	if get_slide_count() >= 1:
		for x in range(get_slide_count()):
			var collider : KinematicBody2D = get_slide_collision(x).collider
			if "Table" in collider.name:
				velocity.y = -40 + (abs(table.global_position.x - global_position.x)/8.0 * 30)
				if velocity.x <= 0 and table.global_position.x - global_position.x < 0:
					velocity.x *= -1
				if velocity.x >= 0 and table.global_position.x - global_position.x > 0:
					velocity.x *= -1
	if global_position.x >= 116:
		velocity.x *= -1
	if global_position.x <= 20:
		velocity.x *= -1
	if global_position.y <= 0:
		velocity.y *= -1
	if global_position.y >= 110:
		get_parent().check_game_over()
		queue_free()
