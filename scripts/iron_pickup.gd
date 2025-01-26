extends Area2D



func _on_body_entered(body):
	GlobalPickup.play(0)
	ResourceManager.add_iron()
	queue_free()
