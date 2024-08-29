extends HBoxContainer

@onready var HeartGui = preload("res://prefabs/heart_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxHearts(max: int):
	for i in max:
		var heart = HeartGui.instantiate()
		add_child(heart)

func updateHearts(current_health: int):
	var hearts = get_children()
	
	for i in range(current_health):
		hearts[i].update(true)
	
	for i in range(current_health, hearts.size()):
		hearts[i].update(false)
