extends CharacterBody2D

var speed = 30
var max_speed = 90
var player_chase = false
var player = null
var target_node_name = "Player_fight"
var can_speed_increase = true

@onready var detection_zone = $"detection zone"
@onready var stamina_bar = $TextureProgressBar
@onready var stamina_decrease = $stamina_decrease
@onready var speed_increase = $speed_increase

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)
	stamina_decrease.start()

func _physics_process(delta):
	if can_speed_increase == true and player_chase == true:
		speed += 0.1
	if speed >= max_speed:
		speed = max_speed
		can_speed_increase = false
	
	var bodies = detection_zone.get_overlapping_bodies()
	
	for body in bodies:
		if body.name == target_node_name:
			player = body
	
	if player_chase == true:
		position += (player.position - position).normalized() * speed * delta
		move_and_collide(Vector2(0,0))
	
		
func DialogueSignal(arg: String):
	if arg == "start_fight":
		player_chase = true
	if arg == "resume_fight":
		player_chase = true


func _on_stamina_decrease_timeout():
	if player_chase == true:
		if stamina_bar.value == 45:
			Dialogic.start("stamina75")
			player.can_move = false
			player_chase = false
		stamina_bar.value -= 1
	if stamina_bar.value < 50:
		speed -= 1
