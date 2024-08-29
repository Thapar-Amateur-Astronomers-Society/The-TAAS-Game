extends Area2D

@onready var animation = %explode_sprite
@onready var boom = %"ship-explode_sound"

# Called when the node enters the scene tree for the first time.
func _ready():
	await boom.finished
	queue_free()
