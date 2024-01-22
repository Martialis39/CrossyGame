extends Sprite2D

const SPEED = 300

var state = 'moving'

# Called when the node enters the scene tree for the first time.
func _ready():
	var area = $HitDetectionArea2D
	area.area_entered.connect(on_area_entered)
	area.area_exited.connect(on_area_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 'moving':
		global_position.x -= SPEED * delta
	pass

func on_area_entered(area):
	state = 'hit'

func on_area_exited(area):
	state = 'moving'
