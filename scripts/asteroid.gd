extends Area2D

@export var speed = 5.0
@export var rot_speed = randf_range(-0.01, 0.01)

@onready var animate = $AnimatedSprite2D
@onready var sound = $destroy_sound
@onready var hit = $hit_sound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed
	rotation += rot_speed
	if animate.frame == 6 :
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is laser:
		sound.play()
	elif area is player:
		hit.play()
	animate.play()

