extends Node2D

@onready var bg = $bg
@onready var bg_timer = $Timers/bg_timer
@onready var player_spawn = $Timers/player_spawn
@onready var start_dialogue = $Timers/start_dialogue
@onready var warmup_loop = $warmup_loop
@onready var warmup_intro = $warmup_intro
@onready var intro_timer = $intro_timer

var player_scene = preload("res://scenes/player_fight.tscn")
var neeko_scene = preload("res://scenes/neeko_fight.tscn")

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)
	warmup_intro.play()
	intro_timer.start()

func DialogueSignal(arg: String):
	if arg == "stop_music":
		queue_free()

func _on_bg_timer_timeout():
	bg.play("default")
	player_spawn.start()
	start_dialogue.start()

func _on_player_spawn_timeout():
	spawn_fellas(Vector2(54,56),Vector2(154,56))

func _on_start_dialogue_timeout():
	Dialogic.start("starting_fight")

func spawn_fellas(player_location: Vector2, neeko_location: Vector2):
	# Instantiate the player scene
	var player_instance = player_scene.instantiate()
	var neeko_instance = neeko_scene.instantiate()

	# Set the player's position
	if player_instance is Node2D:
		player_instance.position = player_location
	if neeko_instance is Node2D:
		neeko_instance.position = neeko_location

	# Add the player instance to the current scene
	get_tree().current_scene.add_child(player_instance)
	get_tree().current_scene.add_child(neeko_instance)


func _on_intro_timer_timeout():
	warmup_loop.play()
