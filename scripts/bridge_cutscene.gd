extends Node2D

@onready var spawn_player = $spawn_player
@onready var spawn_neeko = $spawn_neeko
@onready var spawn_ada = $spawn_ada
@onready var start_dialogue = $start_dialogue
@onready var player = $Player_cutscene_bridge
@onready var neeko = $neeko_bridge
@onready var ada = $ada_bridge
@onready var dust_particle = $"dust particle"
@onready var layer_bridge = $TileMap/Layer_bridge
@onready var bg_song = $bg_song
@onready var bridge_boom = $bridge_boom

var exited_building = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
	spawn_player.start()

func _physics_process(delta):
	if exited_building == false:
		if player.position.y >= 78:
			player.velocity.y = 0
		
		if neeko.position.y >= 0 and neeko.velocity.x == 0:
			neeko.velocity.y = 35
			neeko.velocity.x = 35
		if neeko.position.y >= 48:
			neeko.velocity.y = 0
			neeko.velocity.x = 0
		
		if ada.position.y >= 48:
			ada.velocity.y = 0
			ada.velocity.x = 0

func _on_spawn_player_timeout():
	spawn_neeko.start()
	player.can_move = true
	player.visible = true
	player.velocity.y = 50

func _on_spawn_neeko_timeout():
	spawn_ada.start()
	neeko.can_move = true
	neeko.visible = true
	neeko.velocity.y = 50

func _on_spawn_ada_timeout():
	start_dialogue.start()
	ada.can_move = true
	ada.visible = true
	ada.velocity.y = 50

func DialogicSignal(arg: String):
	if arg == "walk_left":
		player.velocity.x = -50
		neeko.velocity.x = -50
		ada.velocity.x = -50
		exited_building = true
	if arg == "step_on_bridge":
		player.can_move = true
		neeko.can_move = true
		ada.can_move = true
		player.velocity.x = -50
		neeko.velocity.x = -50
		ada.velocity.x = -50
	if arg == "cutscene_over":
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		Global.last_building = "bridge"
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_start_dialogue_timeout():
	Dialogic.start("bridge_talk_1")


func _on_area_2d_body_entered(body):
	player.can_move = false
	neeko.can_move = false
	ada.can_move = false
	Dialogic.start("bridge_talk_2")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Player"):
		player.can_move = false
		neeko.can_move = false
		ada.can_move = false
		dust_particle.emitting = true
		Sirens.stream_paused = true
		bridge_boom.playing = true
		await get_tree().create_timer(2.5).timeout
		dust_particle.emitting = false
		layer_bridge.visible = false
		await get_tree().create_timer(0.3).timeout
		Dialogic.start("bridge_talk_3")
		bridge_boom.playing = false
