extends Area2D

@onready var player = $"../../Player"

func _on_body_entered(body):
	player.resource_amount_battery += 1
	queue_free()
