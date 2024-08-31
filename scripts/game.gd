extends Node2D

# Spawn enemies randomly

@onready var asteroid_prefab = preload("res://prefabs/asteroid.tscn")
@onready var heartsContainer = $HeartsCanvas/HeartsContainer

@onready var gameOverScene = preload("res://scenes/game_over.tscn")

@export var score = 0
@export var time = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()
	heartsContainer.setMaxHearts($player.MAX_HEALTH)
	heartsContainer.updateHearts($player.CURR_HEALTH)
	$player.healthChanged.connect(heartsContainer.updateHearts)
	$player.enemyHit.connect(_on_enemy_hit)
	$player.playerDeathStart.connect(game_over)


func _on_asteroid_timer_timeout():
	var enemy = asteroid_prefab.instantiate()
	var enemy_y = randf_range(64.0, 968.0)
	var enemy_size = randf_range(2.0, 5.0)
	var enemy_rot = randf_range(0.0, 360.0)
	enemy.position = Vector2(2000, enemy_y)
	enemy.scale = Vector2(enemy_size, enemy_size)
	enemy.rotation = enemy_rot
	enemy.enemy_killed.connect(_on_enemy_killed)
	add_child(enemy)


func _update_ui():
	score = max(score, 0)
	time = max(time, 0)
	$scorebar/scoreLabel.text = "AURA: " + str(score)
	%timer_label.text = ":" + str(time)
	if time == 10:
		%AnimationPlayer.play("blink_slow")
	if time == 5:
		%AnimationPlayer.play("blink_fast")
	if time <= 1:
		%player.queue_free()
		game_over(true)

func _on_enemy_killed():
	score += 10
	_update_ui()
	
func _on_enemy_hit():
	score -= 5
	_update_ui()


func _on_score_timer_timeout():
	score += 1
	_update_ui()
	

# func to change scene to game over screen
func game_over(congrats : bool = false):
	$ScoreTimer.stop()
	$SecondTimer.stop()
	$scorebar.visible = false
	$"bgmusic-player".stop()
	await $player.tree_exiting
	var game_over_gui = gameOverScene.instantiate()
	game_over_gui._congrats(congrats)
	game_over_gui.aura = score
	get_parent().add_child(game_over_gui)


func _on_second_timer_timeout():
	time -= 1
	
