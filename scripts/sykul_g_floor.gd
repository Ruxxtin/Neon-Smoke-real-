extends Node2D

@onready var cutscene_timer = $cutscene_timer
@onready var neeko_cutscene = $Neeko_cutscene

var player_scene = preload("res://scenes/player_cutscene.tscn")

func _ready():
	
	Dialogic.signal_event.connect(DialogueSignal)
	
	if Global.start_cutscene_played == true:
		var player = $Player  # Reference to your player node
		match Global.last_building:
			"basement":
				player.position = Vector2(15, 70)  # Spawn location for Building A
			"outside":
				player.position = Vector2(112, 257)  # Spawn location for Building B
			_:
				player.position = Vector2(0, 0)  # Default position

func DialogueSignal(arg: String):
	if arg == "player_enter":
		
		cutscene_timer.start()
		var player_scene: Node = player_scene.instantiate()
		spawn_player(Vector2(15,84))


func _on_cutscene_timer_timeout():
	run_dialogue("shrimpFriedRicePt2")

func run_dialogue(dialogue_timeline):
	Dialogic.start(dialogue_timeline)

func spawn_player(location: Vector2):
	# Instantiate the player scene
	var player_instance = player_scene.instantiate()

	# Set the player's position
	if player_instance is Node2D:
		player_instance.position = location

	# Add the player instance to the current scene
	get_tree().current_scene.add_child(player_instance)
