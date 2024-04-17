extends Button

func _ready():
	pressed.connect(_on_button_pressed)
	pass # Replace with function body.

func _on_button_pressed():
	GameState.CURRENT_LEVEL += 1
	var path = GameState.LEVELS[GameState.CURRENT_LEVEL]
	LevelSwitcher.goto_scene(path)
