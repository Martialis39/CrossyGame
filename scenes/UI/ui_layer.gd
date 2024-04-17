extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	Events.level_over.connect(func(): visible = true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
