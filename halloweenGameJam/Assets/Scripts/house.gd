extends StaticBody2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var candyMode = false
var inRange = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(candyMode == true && Input.is_action_pressed("Grab") && inRange == true):
		print("Trick or Treat")
		candyMode = false
		GameManager.ammo += 10
		sprite.texture = load("res://Assets/Sprites/HouseLightOff.png")
	pass


func _on_timer_timeout() -> void:
	var roll = randi_range(1,15)
	if roll == 1:
		candy_mode()
	pass # Replace with function body.
func candy_mode():
	candyMode = true
	sprite.texture = load("res://Assets/Sprites/HouseLightOn.png")


func _on_candy_mode_body_entered(body: Node2D) -> void:
	inRange = true
	pass # Replace with function body.


func _on_candy_mode_body_exited(body: Node2D) -> void:
	inRange = false
	pass # Replace with function body.
