extends Node

var score = 0
var health = 100
var wave = 1

var ammo = 25

var mask = 1

var enemy_count = 5
var enemy_health = 3
@onready var gameWorld = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func gain_score():
	score += 100
	print("Increased score")
	
func game_ready(node):
	gameWorld = node
	
