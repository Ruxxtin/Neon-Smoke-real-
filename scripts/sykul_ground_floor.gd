extends Node2D

@onready var player = $Player

func _ready():
	match Global.last_building:
		"outside":
			player.position = Vector2(152, 254)  # Spawn location for Building A
		"basement":
			player.position = Vector2(16, 75)
		_:
			player.position = Vector2(0, 0)  # Default position
