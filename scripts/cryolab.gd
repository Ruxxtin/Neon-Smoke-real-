extends Node2D

#region references
@onready var space_button = $Player_stuck/Camera2D/space_button
@onready var cryostasis_transparent = $CryostasisTransparent
@onready var player_stuck = $Player_stuck
@onready var player = $Player
@onready var camera_2d = $Player/Camera2D
@onready var ice_punch_1 = $"ice punch 1"
@onready var ice_punch_2 = $"ice punch 2"
@onready var ice_punch_3 = $"ice punch 3"
@onready var stuck_cam = $Player_stuck/Camera2D
@onready var gpu_particles_2d = $GPUParticles2D
@onready var battery_pickup = $battery_pickup
#endregion

#region variables
var punches = 0
var can_punch = false
var dialogue_over = false
var button_can_change = false
#endregion

func _ready():
	if Global.start_cutscene_played == true:
		battery_pickup.visible = true
		can_punch = false
		cryostasis_transparent.texture = load("res://sprites/cryoshattered transparent.png")
	else:
		battery_pickup.visible = false
	
	if Global.start_cutscene_played == false:
		camera_2d.enabled = false
	
	if Global.start_cutscene_played == false:
		Dialogic.signal_event.connect(DialogueSignal)
	
	var player = $Player  # Reference to your player node
	match Global.last_building:
		"stairs_to_cryolab":
			player.position = Vector2(497, -20)  # Spawn location for Building A
			player_stuck.queue_free()
		#_:
		#	player.position = Vector2(-24, -2)  # Default position

func _physics_process(delta):
	
	if Input.is_action_just_pressed("space") and Global.start_cutscene_played == false:
		if dialogue_over == true and can_punch == false:
			can_punch = true
		if can_punch == true:
			stuck_cam.apply_shake()
			punches += 1
			button_can_change = true
			gpu_particles_2d.emitting = true
			if punches == 1:
				ice_punch_1.play(0.1)
			if punches == 2:
				ice_punch_2.play(0)
				Dialogic.start("ouch_glass")
				dialogue_over = false
				can_punch = false
			if punches == 3:
				ice_punch_3.play(0)
	if Input.is_action_pressed("space") and can_punch == true:
		if punches < 3 and button_can_change == true:
			space_button.texture = load("res://sprites/press_space to break down.png")
	else:
		if punches < 3 and can_punch == true:
			space_button.texture = load("res://sprites/press_space break out.png")
	
	if punches == 2:
		cryostasis_transparent.texture = load("res://sprites/cryostasisbroke transparent.png")
	if punches == 3 and can_punch == true:
		cryostasis_transparent.texture = load("res://sprites/cryoshattered transparent.png")
		player.visible = true
		player.position = Vector2(-24, -2)
		player_stuck.queue_free()
		can_punch = false
		dialogue_over = false
		camera_2d.enabled = true

func _on_dialogue_timer_timeout():
	if Global.start_cutscene_played == false:
		Dialogic.start("what the")

func DialogueSignal(arg: String):
	if arg == "can_punch":
		space_button.visible = true
		dialogue_over = true
		can_punch = true
	if arg == "keep_punching":
		dialogue_over = true
		can_punch = true
