extends Node2D
class_name GameWorld
#TODO CHANGE FROM WAVE SYSTEM TO JUST INFINITE SYSTEM
@onready var cursor = get_node_or_null("GameWorld/CursorSprite")

@onready var score = GameManager.score
@onready var wave = GameManager.wave
@onready var health = GameManager.health
@onready var ammo = GameManager.ammo

@export var Child_Scene: PackedScene
@export var spawn_radius: float = 350

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerUI.show()
	$GameOverUI.hide()
	#UI Initializations
	$PlayerUI/PlayerHealthLabel.text = str("Health: " + str(health))
	$PlayerUI/WaveLabel.text = str("Wave: " + str(wave))
	$PlayerUI/PlayerScoreLabel.text = str("Score: " + str(score))
	$PlayerUI/AmmoLabel.text = str("Candy: " + str(ammo))
	
	GameManager.game_ready(self)
	spawn_wave(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_UI()
	if(GameManager.enemy_count <= 0):
		GameManager.wave += 1
		spawn_wave(5)
	pass
	
#func update_user_score(score: int):
	#$PlayerUI/PlayerScoreLabel = "Score: " + GameManager.score


func _on_demon_mask_button_pressed() -> void:
	$Player/Sprite2D.texture = load("res://Assets/Sprites/Players/PlayerDemon.png")
	GameManager.mask = 1
	pass # Replace with function body.


func _on_frankie_mask_button_pressed() -> void:
	$Player/Sprite2D.texture = load("res://Assets/Sprites/Players/PlayerFrankie.png")
	GameManager.mask = 2
	pass # Replace with function body.


func _on_princess_mask_button_pressed() -> void:
	$Player/Sprite2D.texture = load("res://Assets/Sprites/Players/PlayerPrincess.png")
	GameManager.mask = 3
	pass # Replace with function body.
	
func update_UI():
	$PlayerUI/PlayerHealthLabel.text = str("Health: " + str(GameManager.health))
	$PlayerUI/WaveLabel.text = str("Wave: " + str(GameManager.wave))
	$PlayerUI/PlayerScoreLabel.text = str("Score: " + str(GameManager.score))
	$PlayerUI/AmmoLabel.text = str("Candy: " + str(GameManager.ammo))
	
func spawn_enemy():
	var player = get_tree().get_first_node_in_group("Player")
	if player == null or Child_Scene == null:
		return
	
	var enemy = Child_Scene.instantiate()
	var angle = randf() * TAU
	enemy.global_position = Vector2(0,0) + Vector2.RIGHT.rotated(angle) * spawn_radius
	add_child(enemy)

func spawn_wave(count: int):
	GameManager.enemy_count = 5
	for i in count:
		spawn_enemy()
		await get_tree().create_timer(0.5).timeout


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/TitleScreen.tscn")
	pass # Replace with function body.
