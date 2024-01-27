extends Node2D


# Wait 5 sec
# play dive animation
# wait until animation finishes
# wait another 5 sec
# play surface animation
# wait until animation finishes

@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var area_2d = $Area2D

var last_state = 'surface'

func _ready():
	timer.start()
	timer.timeout.connect(on_timeout)
	area_2d.add_to_group('turtle')
	animation_player.animation_finished.connect(on_animation_end)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass



func fade_out():
	$Legs.visible = false
	$TurtleHead.visible = false
	var t = create_tween()
	t.tween_property($TurtleBody, "material:shader_parameter/range", 1.0, 0.7)
	t.finished.connect(func():
		collision_shape_2d.disabled = true
		last_state = "dive"
		timer.start()
	)

func fade_in():
	var t = create_tween()
	t.tween_property($TurtleBody, "material:shader_parameter/range", 0.0, 0.7)
	t.finished.connect(func():
		collision_shape_2d.disabled = false
		$Legs.visible = true
		$TurtleHead.visible = true
		animation_player.play('surface')
	)

func on_timeout():
	if last_state == 'surface':
		animation_player.play('dive')
		print("in timeout, last state == surface")
	if last_state == 'dive':
		print("in timeout, last state == dive")
		fade_in()

func on_animation_end(anim):
	if anim == 'surface':
		last_state = 'surface'
		print("in animation end")
		timer.start()
