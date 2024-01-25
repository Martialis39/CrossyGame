extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play('dive')
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade_out():
	$Legs.visible = false
	$TurtleHead.visible = false
	var t = create_tween()
	t.tween_property($TurtleBody, "material:shader_parameter/range", 1.0, 0.7)
