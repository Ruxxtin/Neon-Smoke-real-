extends Area2D



func _on_body_entered(body):
	ResourceManager.add_iron()
	queue_free()
