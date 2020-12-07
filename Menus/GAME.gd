extends Node2D

const BLOCK : PackedScene = preload("res://game/Block.tscn")

# Executes at the start of the scene
func _ready():
	randomize()
	$Ball.table = $Table
	$Ball.velocity = Vector2(-20 + randi() % 40, 1)
	for x in range(10):
		for y in range(10):
			var block : Area2D = BLOCK.instance()
			$BLOCKS.add_child(block)
			block.global_position = Vector2(28 + 9 * x, 7 + 5 * y)

# Checks if the player lose
func check_game_over():
	get_tree().change_scene("res://Menus/GAMEOVER.tscn")

# Executes every frame
func _process(_delta):
	if $BLOCKS.get_child_count() == 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/WIN.tscn")


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
