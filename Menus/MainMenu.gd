extends Control

var showing : bool = false
var current_arrow : int = 0

const CREDITS : PackedScene = preload("res://Menus/credits.tscn")

# Executes at the start of the scene
func _ready():
	OS.window_size = Vector2(136 * 4, 96 * 4)
	$arrow.hide()
	$arrow2.hide()
	$arrow3.hide()
	$AnimationPlayer.play("enter")

# Show the main menu
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "enter":
		showing = true
		$arrow.show()
		current_arrow = 1

# Executes every frame
func _process(_delta):
	if showing:
		if Input.is_action_just_pressed("ui_accept"):
			if current_arrow == 1:
				get_tree().change_scene("res://Menus/GAME.tscn")
			if current_arrow == 3:
				get_tree().quit()
			if current_arrow == 2:
				showing = false
				add_child(CREDITS.instance())
		elif Input.is_action_just_pressed("ui_down") and current_arrow <= 2:
			current_arrow += 1
			update_arrow()
		elif Input.is_action_just_pressed("ui_up") and current_arrow >= 2:
			current_arrow -= 1
			update_arrow()

# Update current arrow
func update_arrow():
	$arrow.hide()
	$arrow2.hide()
	$arrow3.hide()
	if current_arrow == 1:
		$arrow.show()
	elif current_arrow == 2:
		$arrow2.show()
	else:
		$arrow3.show()

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
