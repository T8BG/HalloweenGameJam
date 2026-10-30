extends CharacterBody2D

var player = null
const SPEED = 250

func _ready() -> void:
	add_to_group("Children")
	player = get_tree().get_nodes_in_group("Player")

func _physics_process(delta: float) -> void:
	if not is_instance_valid(player):
		player = get_tree().get_first_node_in_group("Player")
		if player == null:
			return
	var direciton = (player.global_position - global_position).normalized()
	velocity = direciton * SPEED
	#print(str(global_position.x))
	#print(str(global_position.y))
	move_and_slide()
	
	rotation = direciton.angle() + deg_to_rad(90)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.health -= 10
		GameManager.enemy_count -= 1
		queue_free()
	pass # Replace with function body.
