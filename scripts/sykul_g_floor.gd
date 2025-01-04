extends Node2D

func _ready():
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"basement":
			player.position = Vector2(15, 70)  # Spawn location for Building A
		"outside":
			player.position = Vector2(112, 257)  # Spawn location for Building B
		_:
			player.position = Vector2(0, 0)  # Default position
