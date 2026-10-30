extends Area2D
const speed = 1250
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += (global_transform.y * speed * delta) * -1
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		return
	if body.is_in_group("Children"):
		if(GameManager.enemy_health > 0):
			GameManager.enemy_health -= 1
		else:
			body.queue_free()
			GameManager.score += 100
			GameManager.enemy_count -= 1
	queue_free()
	pass # Replace with function body.
