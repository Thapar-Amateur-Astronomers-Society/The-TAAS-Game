extends Control

@onready var start_sound = $start_sound
@onready var blink = %AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _input(event):
	if event.is_action_pressed("player_shoot"):
		blink.stop()
		start_sound.play()
		await start_sound.finished
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/main.tscn")
