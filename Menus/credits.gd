extends CanvasLayer

# Executes every frame
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().showing = true
		queue_free()
