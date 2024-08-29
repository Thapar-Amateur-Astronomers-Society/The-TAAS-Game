extends Area2D

signal exploded

@onready var animation = %explode_sprite
@onready var boom = %"ship-explode_sound"

# Called when the node enters the scene tree for the first time.
func _ready():
	await boom.finished
	queue_free()
