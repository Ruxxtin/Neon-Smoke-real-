extends Node2D

@onready var ui = $ui
@onready var player = $Player
@onready var dust_particle = $"dust particle"

func _ready():
	
	
	Global.start_cutscene_played = true
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"sykul":
			player.position = Vector2(16, 7)  # Spawn location for Building A
		"arcade":
			player.position = Vector2(410, -448)  # Spawn location for Building B
		_:
			player.position = Vector2(0, 0)  # Default position
			
