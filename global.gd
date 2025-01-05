extends Node2D

var crafting_dragging = false
var last_building = ""  # Tracks the last building
var player_position = Vector2()  # Tracks the player's position when changing scenes
var player_name = "Player"

var start_cutscene_played = false

signal player_enter_cutscene()

func _ready():
	player_enter_cutscene.connect(player_enter)

func player_enter():
	pass
