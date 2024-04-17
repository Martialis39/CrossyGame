extends Button

func _ready():
	pressed.connect(_on_button_pressed)
	pass # Replace with function body.

func _on_button_pressed():
	get_tree().quit()
