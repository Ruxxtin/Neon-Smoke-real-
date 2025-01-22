extends Area2D



func _on_body_entered(body):
	ResourceManager.add_wire()
	queue_free()
