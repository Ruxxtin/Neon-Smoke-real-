extends Node2D

@onready var cutscene_timer = $cutscene_timer
@onready var neeko_cutscene = $Neeko_cutscene
@onready var camera_2d = $Camera2D

var player_scene = preload("res://scenes/player_cutscene.tscn")
var started_fight = false
var fight_scene = preload("res://scenes/neeko_and_ada_fight.tscn")
var camera_go_down = false

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

func _physics_process(delta):
	if Global.start_cutscene_played == false:
		if camera_go_down == true:
			camera_2d.position.y += 0.7

func DialogueSignal(arg: String):
	if arg == "player_enter":
		cutscene_timer.start()
		var player_scene: Node = player_scene.instantiate()
		spawn_player(Vector2(15,84))
	if arg == "start_fight" and started_fight == false:
		start_fight(Vector2(0,0))
		started_fight = true
	if arg == "leave_tower":
		camera_go_down = true


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

func start_fight(location: Vector2):
	# Instantiate the fight scene
	var fight_instance = fight_scene.instantiate()
	
	if fight_instance is Node2D:
		fight_instance.position = location
	
	
	# Add the fight instance to the current scene
	get_tree().current_scene.add_child(fight_instance)
	
