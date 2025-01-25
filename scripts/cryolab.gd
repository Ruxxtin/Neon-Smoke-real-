extends Node2D

func _ready():
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"stairs_to_cryolab":
			player.position = Vector2(497, -20)  # Spawn location for Building A
		_:
			player.position = Vector2(-24, -2)  # Default position
