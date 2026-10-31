extends Node2D
var star_speed = 10

var random_y_posit = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func star_movement(delta: float, star_speed_multiplier: int):
	global_position.x += star_speed * star_speed_multiplier * delta * -1
	if(global_position.x <= -500):
		#reset
		global_position.x = 1700
		random_y_posit = randi_range(50, get_window().size.y)
		global_position.y = random_y_posit
