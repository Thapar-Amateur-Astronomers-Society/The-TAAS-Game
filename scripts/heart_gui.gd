extends Panel

@export var damaged = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(whole: bool):
	if (not whole) and (not damaged) :
		$AnimatedSprite2D.play()
		


func _on_animated_sprite_2d_animation_finished():
	damaged = true
