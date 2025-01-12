extends Node2D

var crafting_dragging = false
var last_building = ""  # Tracks the last building
var player_position = Vector2()  # Tracks the player's position when changing scenes
var player_name = "Player"
var fight_instance = null
var start_cutscene_played = false
var fight_over = false

signal player_enter_cutscene()

func _ready():
	player_enter_cutscene.connect(player_enter)

func _process(delta):
	player_name = Dialogic.VAR.playername

func player_enter():
	pass
