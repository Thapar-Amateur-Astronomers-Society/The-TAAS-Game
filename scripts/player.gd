extends Area2D
class_name player

signal healthChanged
signal enemyHit

@export var speed = 3.0
@export var cooldown = 1.0
@export var MAX_HEALTH = 3

@onready var laser_prefab = preload("res://prefabs/laser.tscn")
@onready var laser_timer = $LaserInterval
@onready var laser_sound = $laser_sound
@onready var damaged_sprites = $player_sprites/ship_Sprite2D
@onready var CURR_HEALTH = MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready():
	damaged_sprites.frame = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("player_up") and position.y > 64:
		position.y -= speed
	if Input.is_action_pressed("player_down") and position.y < 968:
		position.y += speed
	if Input.is_action_pressed("player_left") and position.x > 64:
		position.x -= speed
	if Input.is_action_pressed("player_right") and position.x < 968:
		position.x += speed
		
	if Input.is_action_just_pressed("player_shoot") and laser_timer.is_stopped():
		laser_timer.start(cooldown)
		var laser = laser_prefab.instantiate()
		laser.position.x = position.x + 100
		laser.position.y = position.y
		get_parent().add_child(laser)
		laser_sound.play()
		


func _on_area_entered(area):
	# What to do upon collision with player body
	if area is enemy:
		CURR_HEALTH -= 1
		CURR_HEALTH = maxi(CURR_HEALTH, 0)
		damaged_sprites.frame += 1
		healthChanged.emit(CURR_HEALTH)
		enemyHit.emit()
	
