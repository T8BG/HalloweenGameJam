extends CharacterBody2D
const SPEED =800
var screen_size

@export var Candy_Scene: PackedScene

func _physics_process(delta: float) -> void:
	#Shoot stuff
	if Input.is_action_just_pressed("Shoot"):
		shoot()
	#Movement stuff
	var direction = Vector2.ZERO
	if Input.is_action_pressed("Up"):
		direction.y -= 1
		print(global_position.y)
	if Input.is_action_pressed("Down"):
		direction.y += 1
		print(global_position.y)
	if Input.is_action_pressed("Left"):
		direction.x -= 1
		print(global_position.x)
	if Input.is_action_pressed("Right"):
		direction.x += 1
		print(global_position.x)
		
	if direction.length() > 0:
		direction = direction.normalized() * SPEED
	
	position += direction * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	rotate_player()

func rotate_player():
	rotation = (get_global_mouse_position() -global_position).angle() + deg_to_rad(90)

func shoot():
	var b = Candy_Scene.instantiate()
	get_tree().current_scene.add_child(b)
	b.global_position = global_position
	b.global_rotation = global_rotation
