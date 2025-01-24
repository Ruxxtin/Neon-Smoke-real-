extends Node2D

@onready var ui = $ui
@onready var player = $Player

func _ready():
	Global.start_cutscene_played = true
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"sykul":
			player.position = Vector2(16, 7)  # Spawn location for Building A
		"arcade":
			player.position = Vector2(281, -455)  # Spawn location for Building B
		_:
			player.position = Vector2(0, 0)  # Default position
			
