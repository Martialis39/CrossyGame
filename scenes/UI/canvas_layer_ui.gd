extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.visible = false
	Events.level_over.connect(_on_level_over)
	pass # Replace with function body.

func _on_level_over():
	$AnimationPlayer.play('FadeIn')
