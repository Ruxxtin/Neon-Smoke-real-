extends Node2D

@onready var space_button = $Player_stuck/Camera2D/space_button
@onready var cryostasis_transparent = $CryostasisTransparent
@onready var player_stuck = $Player_stuck
@onready var player = $Player
@onready var camera_2d = $Player/Camera2D
var punches = 0
var can_punch = false
var dialogue_over = false

func _ready():
	camera_2d.enabled = false
	
	Dialogic.signal_event.connect(DialogueSignal)
	
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"stairs_to_cryolab":
			player.position = Vector2(497, -20)  # Spawn location for Building A
		#_:
		#	player.position = Vector2(-24, -2)  # Default position

func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		if dialogue_over == true and can_punch == false:
			can_punch = true
		elif can_punch == true:
			punches += 1
	if Input.is_action_pressed("space"):
		if punches < 2:
			space_button.texture = load("res://sprites/press_space_down.png")
	else:
		if punches < 2:
			space_button.texture = load("res://sprites/press_space.png")
	
	if punches == 1:
		cryostasis_transparent.texture = load("res://sprites/cryostasisbroke transparent.png")
	if punches == 2 and can_punch == true:
		cryostasis_transparent.texture = load("res://sprites/cryoshattered transparent.png")
		player.visible = true
		player.position = Vector2(-24, -2)
		player_stuck.queue_free()
		can_punch = false
		dialogue_over = false
		camera_2d.enabled = true

func _on_dialogue_timer_timeout():
	Dialogic.start("what the")

func DialogueSignal(arg: String):
	if arg == "can_punch":
		space_button.visible = true
		dialogue_over = true
