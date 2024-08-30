extends Control

@export var score = 0

@onready var label = $scoreLabel

func score_set(x):
	score = x

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = ""
	if score > 0:
		label.text = "+"
	elif score < 0:
		label.text = "-"
	label.text += str(absi(score))
