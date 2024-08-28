extends Control

@onready var game = preload("res://scenes/main.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
	if event.is_action_pressed("player_shoot"):
		get_tree().change_scene_to_packed(game)
