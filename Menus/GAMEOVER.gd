extends Control

# Executes every frame
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/MainMenu.tscn")
