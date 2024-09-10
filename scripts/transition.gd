extends CanvasLayer

signal on_transition_finished

@onready var colorRect = %ColorRect
@onready var animation_player = %AnimationPlayer
var transition_in_progress = false

# Called when the node enters the scene tree for the first time.
func _ready():
	colorRect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		colorRect.visible = false


func transition():
	colorRect.visible = true
	animation_player.play("fade_to_black")
