extends Node2D
@onready var player = $Player


func _ready():
	match Global.last_building:
		"outside":
			player.position = Vector2(295, 232)
		"game":
			player.position = Vector2(118, 86)
		_:
			player.position = Vector2(295, 232)  # Default position
