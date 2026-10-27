extends Area2D
const speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.y * speed * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Children"):
		body.queue_free()
	queue_free()
	pass # Replace with function body.
