extends CharacterBody2D
const SPEED = 700
var screen_size

const SPREAD_ANGLE = 20.0
const BURST_DELAY = 0.1

var is_bursting = false

@export var Candy_Scene: PackedScene

@onready var mainOverlay = get_node_or_null("/root/GameWorld/PlayerUI") as CanvasLayer
@onready var gameOverOverlay = get_node_or_null("/root/GameWorld/GameOverUI") as CanvasLayer

@onready var gameOverLabel = get_node_or_null("/root/GameWorld/GameOverUI/Label2") as Label

func _ready() -> void:
	add_to_group("Player")
	GameManager.ammo = 25
	GameManager.health = 100
	GameManager.enemy_count = 5
	GameManager.wave = 1

func _physics_process(delta: float) -> void:
	if(GameManager.health >= 1):
		#Shoot stuff
		if Input.is_action_just_pressed("Shoot"):
			shoot()
		#Movement stuff
		var direction = Vector2.ZERO
		if Input.is_action_pressed("Up"):
			direction.y -= 1
			#print(global_position.y)
		if Input.is_action_pressed("Down"):
			direction.y += 1
			#print(global_position.y)
		if Input.is_action_pressed("Left"):
			direction.x -= 1
			#print(global_position.x)
		if Input.is_action_pressed("Right"):
			direction.x += 1
			#print(global_position.x)
			
		if direction.length() > 0:
			direction = direction.normalized() * SPEED
		
		velocity = direction.normalized() * SPEED
		move_and_slide()
		#position = position.clamp(Vector2.ZERO, screen_size)
		rotate_player()
		
	#GAME OVER STUFF
	if(GameManager.health <= 0):
		mainOverlay.hide()
		GameManager.enemy_count = 500
		gameOverLabel.text = "Wave: " + str(GameManager.wave)
		gameOverOverlay.show()

func rotate_player():
	rotation = (get_global_mouse_position() -global_position).angle() + deg_to_rad(90)

func shoot():
	if(GameManager.ammo > 0):
		if(GameManager.mask == 1):
			spawn_bullet()
			GameManager.ammo -= 1
		if(GameManager.mask == 2):
			if(GameManager.ammo >= 3):
				for offset in [-SPREAD_ANGLE, 0.0, SPREAD_ANGLE]:
					spawn_bullet(deg_to_rad(offset))
				GameManager.ammo -= 3
		if(GameManager.mask == 3):
			if is_bursting:
				return
			is_bursting = true
			for i in 3:
				if GameManager.ammo <= 0:
					break
				spawn_bullet()
				GameManager.ammo -= 1
				await get_tree().create_timer(BURST_DELAY).timeout
			is_bursting = false
		
func spawn_bullet(angle_offset: float = 0.0):
	var b = Candy_Scene.instantiate()
	get_tree().current_scene.add_child(b)
	b.global_position = global_position
	b.global_rotation = global_rotation + angle_offset
