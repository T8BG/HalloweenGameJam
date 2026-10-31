extends Control

#BG Stars
@onready var starOne = get_node("/root/TitleScreen/Stars/Star")
@onready var starTwo = get_node("/root/TitleScreen/Stars/Star2")
@onready var starThree = get_node("/root/TitleScreen/Stars/Star3")
@onready var starFour = get_node("/root/TitleScreen/Stars/Star4")
@onready var starFive = get_node("/root/TitleScreen/Stars/Star5")

@onready var start_button = get_node_or_null("TitleScreen/StartButton") as Button
@onready var credits_button = get_node_or_null("TitleScreen/CreditButton") as Button
@onready var quit_button = get_node_or_null("TitleScreen/QuitButton") as Button

@onready var helpUI = get_node_or_null("HelpUI") as CanvasLayer
@onready var creditsUI = get_node_or_null("CreditsUI") as CanvasLayer

#Stars

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#helpUI.hide()
	#creditsUI.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	starOne.star_movement(delta, 12)
	starTwo.star_movement(delta, 14)
	starThree.star_movement(delta, 16)
	starFour.star_movement(delta, 18)
	starFive.star_movement(delta, 20)
	pass


func _on_start_button_pressed() -> void:
	print("Start button pressed")
	GameManager.mask = 1
	GameManager.score = 0
	GameManager.wave = 1
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/GameWorld.tscn")
	pass # Replace with function body.


func _on_help_button_pressed() -> void:
	helpUI.show()
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_credit_button_pressed() -> void:
	creditsUI.show()
	pass # Replace with function body.


func _on_exit_help_pressed() -> void:
	helpUI.hide()
	pass # Replace with function body.


func _on_exit_credits_pressed() -> void:
	creditsUI.hide()
	pass # Replace with function body.
