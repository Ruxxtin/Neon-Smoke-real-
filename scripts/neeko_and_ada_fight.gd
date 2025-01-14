extends Node2D

@onready var bg = $bg
@onready var bg_timer = $Timers/bg_timer
@onready var player_spawn = $Timers/player_spawn
@onready var start_dialogue = $Timers/start_dialogue
@onready var warmup = $warmup

var player_scene = preload("res://scenes/player_fight.tscn")
var neeko_scene = preload("res://scenes/neeko_fight.tscn")
var ada_scene = preload("res://scenes/ada_fight.tscn")
var stop_music = false

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)

func _process(delta):
	if stop_music == true:
		warmup.volume_db -= 0.2
	if warmup.volume_db < -15:
		Global.fight_over = true
		queue_free()

func DialogueSignal(arg: String):
	if arg == "stop_music":
		stop_music = true

func _on_bg_timer_timeout():
	bg.play("default")
	player_spawn.start()
	start_dialogue.start()

func _on_player_spawn_timeout():
	spawn_fellas(Vector2(54,56),Vector2(154,86),Vector2(154,26))

func _on_start_dialogue_timeout():
	Dialogic.start("starting_fight")

func spawn_fellas(player_location: Vector2, neeko_location: Vector2, ada_location: Vector2):
	# Instantiate the scenes
	var player_instance = player_scene.instantiate()
	var neeko_instance = neeko_scene.instantiate()
	var ada_instance = ada_scene.instantiate()

	# Set the positions
	if player_instance is Node2D:
		player_instance.position = player_location
	if neeko_instance is Node2D:
		neeko_instance.position = neeko_location
	if ada_instance is Node2D:
		ada_instance.position = ada_location

	# Add the player instance to the current scene
	get_tree().current_scene.add_child(player_instance)
	get_tree().current_scene.add_child(neeko_instance)
	get_tree().current_scene.add_child(ada_instance)
