extends Control

@export var aura = 0

func _congrats(val: bool):
	if val:
		%gameover.text = "Time Up!"
	else:
		%gameover.text = "You Died."

# Called when the node enters the scene tree for the first time.
func _ready():
	%score.text = str(aura)
	await $gameover_anim.animation_finished
	%"thx-blink".play("blink")


func _input(event):
	if event.is_action_pressed("back_to_menu"):
		$restart_sound.play()
		await $restart_sound.finished
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		queue_free()
