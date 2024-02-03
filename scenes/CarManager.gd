extends Node2D

const CAR = preload("res://scenes/car.tscn")
@onready var timer = $Timer
@onready var targets = $Targets

var cars = []

# Called when the node enters the scene tree for the first time.
func _ready():
	create_cars()
	timer.timeout.connect(on_timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_cars():
	var markers = targets.get_children()
	for m in markers:
		create_car(m)

func create_car(marker):
	var x = marker.global_position.x
	var y = marker.global_position.y
	
	var car_instance = CAR.instantiate()
	car_instance.global_position.x = x
	car_instance.global_position.y = y
	
	add_child(car_instance)
	cars.append(car_instance)
	
	
func delete_old_cars():
	cars = cars.filter(func(car): return is_instance_valid(car))

	for c in cars:
		if c.global_position.x < -100:
			c.queue_free()

func on_timeout():
	create_cars()
	delete_old_cars()
