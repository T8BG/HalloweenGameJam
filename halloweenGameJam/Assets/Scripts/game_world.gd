extends Node2D
@onready var cursor = get_node_or_null("GameWorld/CursorSprite")

@onready var score = GameManager.score
@onready var wave = GameManager.wave
@onready var health = GameManager.health
@onready var ammo = GameManager.ammo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerUI.show()
	$GameOverUI.hide()
	#UI Initializations
	$PlayerUI/PlayerHealthLabel.text = str("Health: " + str(health))
	$PlayerUI/WaveLabel.text = str("Wave: " + str(wave))
	$PlayerUI/PlayerScoreLabel.text = str("Score: " + str(score))
	$PlayerUI/AmmoLabel.text = str("Ammo: " + str(ammo))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func update_user_score(score: int):
	#$PlayerUI/PlayerScoreLabel = "Score: " + GameManager.score
