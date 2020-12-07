extends Area2D

func _on_Left_body_entered(body):
	if "Ball" in body.name:
		body.velocity.x *= -1
		queue_free()

func _on_Right_body_entered(body):
	if "Ball" in body.name:
		body.velocity.x *= -1
		queue_free()

func _on_Down_body_entered(body):
	if "Ball" in body.name:
		body.velocity.y *= -1
		queue_free()

func _on_Up_body_entered(body):
	if "Ball" in body.name:
		body.velocity.y *= -1
		queue_free()
