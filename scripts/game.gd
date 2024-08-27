extends Node2D

# Spawn enemies randomly

@onready var asteroid_prefab = preload("res://prefabs/asteroid.tscn")
@onready var heartsContainer = $HeartsCanvas/HeartsContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	heartsContainer.setMaxHearts($player.MAX_HEALTH)
	heartsContainer.updateHearts($player.CURR_HEALTH)
	$player.healthChanged.connect(heartsContainer.updateHearts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_asteroid_timer_timeout():
	var enemy = asteroid_prefab.instantiate()
	var enemy_y = randf_range(64.0, 968.0)
	var enemy_size = randf_range(2.0, 5.0)
	var enemy_rot = randf_range(0.0, 360.0)
	enemy.position = Vector2(2000, enemy_y)
	enemy.scale = Vector2(enemy_size, enemy_size)
	enemy.rotation = enemy_rot
	add_child(enemy)
